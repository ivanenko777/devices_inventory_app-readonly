class DeviceTypesController < ApplicationController

  # GET /device_types
  def index
    @device_types = DeviceType.all
  end
end
