# == Schema Information
#
# Table name: vehicle_inspections
#
#  id                   :bigint           not null, primary key
#  vehicle_id           :string
#  inspection_date      :date
#  vehicle_org_id       :string
#  org_name             :text
#  inspection_period_id :string
#  inspection_passed    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class VehicleInspection < ApplicationRecord
  self.primary_keys = :vehicle_id, :inspection_date
end
