class CreateVehicleReports < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_reports do |t|

      t.timestamps
    end
  end
end
