class DeviceHistory < ApplicationRecord
  belongs_to :device
  belongs_to :room

  validates :device_id, presence: true
  validates :room_id, presence: true
  validates :status_id, presence: true
  validates :created_by_id, presence: true

  def add(device)
    # nukuriame irasa tik kai device naujas
    # arba paskutiniai room_id ar status_id nesutampa su device room ir status

    last_record = DeviceHistory.where(device_id: device.id).last

    if last_record == nil ||
        last_record.room_id != device.room_id ||
        last_record.status_id != Device.statuses[device.status]

      self.device_id = device.id
      self.room_id = device.room_id
      self.status_id = Device.statuses[device.status]
      self.created_by_id = device.created_by_id
      save
    end
  end
end
