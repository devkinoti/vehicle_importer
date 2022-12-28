class VehicleReportsController < ApplicationController
  before_action :set_vehicle_report, only: %i[ show edit update destroy ]

  # GET /vehicle_reports or /vehicle_reports.json
  def index
    @vehicle_reports = VehicleReport.all
  end

  # GET /vehicle_reports/1 or /vehicle_reports/1.json
  def show
  end

  # GET /vehicle_reports/new
  def new
    @vehicle_report = VehicleReport.new
  end

  # GET /vehicle_reports/1/edit
  def edit
  end

  # POST /vehicle_reports or /vehicle_reports.json
  def create
    @vehicle_report = VehicleReport.new(vehicle_report_params)

    respond_to do |format|
      if @vehicle_report.save && VehicleReportsImporter.new.import_inspection_reports(@vehicle_report).imported?

        format.html { redirect_to vehicle_inspections_path }
      else
        # run cleanup to purge imported files and the created vehicle report
        @vehicle_report.csv_reports.purge 
        @vehicle_report.destroy
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /vehicle_reports/1 or /vehicle_reports/1.json
  def update
    respond_to do |format|
      if @vehicle_report.update(vehicle_report_params)
        format.html { redirect_to vehicle_report_url(@vehicle_report), notice: "Vehicle report was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_reports/1 or /vehicle_reports/1.json
  def destroy
    @vehicle_report.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_reports_url, notice: "Vehicle report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_report
      @vehicle_report = VehicleReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_report_params
      params.require(:vehicle_report).permit(csv_reports: [])
    end
end
