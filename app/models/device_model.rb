class DeviceModel < ApplicationRecord
  belongs_to :device_manufacturer
  belongs_to :device_type

  validates :name, presence: true, uniqueness: {scope: [:device_manufacturer_id, :device_type_id]}
  validates :device_manufacturer_id
  validates :device_type_id
end
