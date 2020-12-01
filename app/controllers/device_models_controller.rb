class DeviceModelsController < ApplicationController

  # GET /device_models/index
  def index
    @device_models = DeviceModel.all
  end
end
