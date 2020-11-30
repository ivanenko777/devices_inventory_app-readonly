class DeviceType < ApplicationRecord

  validates :name, presence: true
  validates :sys_name, presence: true, uniqueness: true

end
