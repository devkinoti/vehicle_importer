# == Schema Information
#
# Table name: vehicle_reports
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VehicleReport < ApplicationRecord
  has_many_attached :csv_reports
end
