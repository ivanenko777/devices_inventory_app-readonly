class DeviceManufacturersController < ApplicationController

  def index
    @manufacturers = DeviceManufacturer.all
  end
end
