class VehicleReport < ApplicationRecord
  has_many_attached :csv_reports
end
