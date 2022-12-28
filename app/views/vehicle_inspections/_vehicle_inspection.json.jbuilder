json.extract! vehicle_inspection, :id, :vehicle_id, :inspection_date, :vehicle_org_id, :org_name, :inspection_period_id, :inspection_passed, :created_at, :updated_at
json.url vehicle_inspection_url(vehicle_inspection, format: :json)
