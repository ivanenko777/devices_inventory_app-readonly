class DeviceModelsController < ApplicationController

  # GET /device_models/index
  def index
    @device_models = DeviceModel.includes(:device_type, :device_manufacturer).all
  end
end
