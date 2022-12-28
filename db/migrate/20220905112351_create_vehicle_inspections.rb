class CreateVehicleInspections < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_inspections do |t|
      t.string :vehicle_id
      t.date :inspection_date
      t.string :vehicle_org_id
      t.text :org_name
      t.string :inspection_period_id
      t.string :inspection_passed

    end
  end
end
