class VehicleReportsImporter
  def import_inspection_reports(vehicle_report)
    import_error_messages = []
    # need to check file names are actually format required
    sorted_file_array = sort_the_files_by_date(vehicle_report)
    
    sorted_file_array.each do |csv_report|
      import_error_messages = import(csv_report)
    end


    if import_error_messages.count == 1 && import_error_messages.first.empty? # postgresql copy returns an array with an empty string if no errors are present
      return Result.new(imported: true, vehicle_report: vehicle_report)
    else
      return Result.new(imported: false, vehicle_report: vehicle_report)
    end



  end

  def sort_the_files_by_date(vehicle_report)
    vehicle_report.csv_reports.sort {|report_a, report_b| report_a.blob.filename <=> report_b.filename }
  end

  def import(report)
    # byebug
    csv_file = ActiveStorage::Blob.service.path_for(report.key) # report.key returns the name of the file in active storage

    conn = ActiveRecord::Base.connection
    rc = conn.raw_connection
    rc.exec("COPY vehicle_inspections (vehicle_id, inspection_date, vehicle_org_id, org_name, inspection_period_id, inspection_passed) from stdin with header csv delimiter '|' ")

    file = File.open(csv_file, "r")
    while !file.eof?
      rc.put_copy_data(file.readline)
    end

    rc.put_copy_end

    error_messages = []

    while res = rc.get_result
      if e_message = res.error_message
        error_messages << e_message
      end
    end

    error_messages
  end

  # notes

  # array = VehicleReport.first.csv_reports.sort {|report_a,report_b| report_a.blob.filename <=> report_b.filename}
  # array.each do |csv_report|
  #  import(csv)
  # end

  # path to blob
  # ActiveStorage::Blob.service.send(:path_for, array.first.key)

    # run rake task to set created_at and updated_at
    # run rake task to remove all saved files



  # Result class

  class Result
    attr_reader :vehicle_report

    def initialize(imported:, vehicle_report:)
      @imported = imported 
      @vehicle_report = vehicle_report
    end

    def imported?
      @imported
    end
  end
end