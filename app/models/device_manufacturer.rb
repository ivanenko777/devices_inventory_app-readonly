class DeviceManufacturer < ApplicationRecord
  has_many :device_models

  validates :name, presence: true

end
