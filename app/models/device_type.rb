class DeviceType < ApplicationRecord
  has_many :device_models

  validates :name, presence: true
  validates :sys_name, presence: true, uniqueness: true

end
