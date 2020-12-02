class DeviceModel < ApplicationRecord
  belongs_to :device_manufacturer
  belongs_to :device_type
  has_many :devices

  scope :filter_by_is_active, ->(active) { where is_active: active }
  scope :filter_by_device_type_id, ->(device_type_id) { where device_type_id: device_type_id }
  scope :filter_by_device_manufacturer_id, ->(device_manufacturer_id) { where device_manufacturer_id: device_manufacturer_id }
  scope :filter_by_device_model_name_contains, ->(name) { where('device_models.name LIKE ?', "%#{name}%") }
  scope :order_by_default, -> { joins(:device_type, :device_manufacturer).order('device_types.name ASC, device_manufacturers.name ASC, device_models.name ASC') }
  scope :order_by_device_model_name_asc, -> { order('device_models.name ASC') }
  scope :order_by_device_model_name_desc, -> { order('device_models.name DESC') }
  scope :order_by_device_type_name_asc, -> { joins(:device_type).order('device_types.name ASC') }
  scope :order_by_device_type_name_desc, -> { joins(:device_type).order('device_types.name DESC') }
  scope :order_by_device_manufacturer_name_asc, -> { joins(:device_manufacturer).order('device_manufacturers.name ASC') }
  scope :order_by_device_manufacturer_name_desc, -> { joins(:device_manufacturer).order('device_manufacturers.name DESC') }

  validates :device_manufacturer_id, presence: true
  validates :device_type_id, presence: true
  validates :name, presence: true, uniqueness: {scope: [:device_manufacturer_id, :device_type_id]}
end
