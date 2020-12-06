class DeviceHistory < ApplicationRecord
  belongs_to :device
  belongs_to :room

  validates :device_id, presence: true
  validates :room_id, presence: true
  validates :status_id, presence: true
  validates :created_by_id, presence: true
end
