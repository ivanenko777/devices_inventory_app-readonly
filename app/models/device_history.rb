class DeviceHistory < ApplicationRecord
  belongs_to :device
  belongs_to :room
end
