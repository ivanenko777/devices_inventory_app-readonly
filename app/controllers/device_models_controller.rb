class DeviceModelsController < ApplicationController
  before_action :set_device_model, only: [:show]

  # GET /device_models/index
  def index
    @device_models = DeviceModel.includes(:device_type, :device_manufacturer).all
  end

  # GET /device_models/1
  def show; end

  private

  def set_device_model
    @device_model = DeviceModel.find(params[:id])
  end
end
