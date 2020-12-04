class Device < ApplicationRecord
  include UserTrackable

  enum status: {
      in_operation: 1,
      decommissioned: 2
  }

  belongs_to :device_model
  belongs_to :room

  validates :device_model_id, presence: true
  validates :room_id, presence: true
  validates :serial_no, presence: true, uniqueness: {scope: :device_model_id}
end
