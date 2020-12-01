class DeviceModel < ApplicationRecord
  belongs_to :device_manufacturer
  belongs_to :device_type

  scope :filter_by_is_active, ->(active) { where is_active: active }

  validates :name, presence: true, uniqueness: {scope: [:device_manufacturer_id, :device_type_id]}
  validates :device_manufacturer_id, presence: true
  validates :device_type_id, presence: true
end
