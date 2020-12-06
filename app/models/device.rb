class Device < ApplicationRecord
  include UserTrackable

  enum status: {
      in_operation: 1,
      decommissioned: 2
  }

  belongs_to :device_model
  belongs_to :room

  scope :default_statuses, -> { where('devices.status NOT IN (2)') }
  scope :filter_by_status, ->(status_id) { where status: status_id }
  scope :filter_by_device_type, ->(device_type_id) { joins(device_model: :device_type).where("device_models.device_type_id = ?", device_type_id) }
  scope :filter_by_device_manufacturer, ->(device_manufacturer_id) {
    joins(:device_model).where('device_models.device_manufacturer_id = ?', device_manufacturer_id)
  }
  scope :filter_by_device_model, ->(device_model_id) { where(device_model_id: device_model_id) }
  scope :filter_by_office, ->(office_id) { joins(:room).where('rooms.office_id = ?', office_id) }
  scope :filter_by_serial_no_or_asset_no_contains, ->(text) { where('devices.serial_no LIKE ? OR devices.asset_no LIKE ?', "%#{text}%", "%#{text}%") }
  scope :order_by_default, -> { joins(device_model: [:device_type, :device_manufacturer]).order('device_types.name ASC, device_manufacturers.name ASC, device_models.name ASC, devices.serial_no ASC') }
  scope :order_by_status_asc, -> { order('devices.status ASC') }
  scope :order_by_status_desc, -> { order('devices.status DESC') }
  scope :order_by_room_asc, -> { joins(:room).order('rooms.name ASC') }
  scope :order_by_room_desc, -> { joins(:room).order('rooms.name DESC') }
  scope :order_by_last_created, -> { order('devices.created_at DESC') }
  scope :order_by_last_updated, -> { order('devices.updated_at DESC') }

  validates :device_model_id, presence: true
  validates :room_id, presence: true
  validates :serial_no, presence: true, uniqueness: {scope: :device_model_id}
end
