class Device < ApplicationRecord
  belongs_to :device_model
  belongs_to :room

  validates :device_model_id, presence: true
  validates :room_id, presence: true
  validates :serial_no, presence: true, uniqueness: {scope: :device_model_id}
end
