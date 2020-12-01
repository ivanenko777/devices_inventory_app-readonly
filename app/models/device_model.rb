class DeviceModel < ApplicationRecord
  belongs_to :device_manufacturer
  belongs_to :device_type

  scope :filter_by_is_active, ->(active) { where is_active: active }
  scope :filter_by_device_type_id, ->(device_type_id) { where device_type_id: device_type_id }
  scope :filter_by_device_manufacturer_id, ->(device_manufacturer_id) { where device_manufacturer_id: device_manufacturer_id }

  validates :name, presence: true, uniqueness: {scope: [:device_manufacturer_id, :device_type_id]}
  validates :device_manufacturer_id, presence: true
  validates :device_type_id, presence: true
end
