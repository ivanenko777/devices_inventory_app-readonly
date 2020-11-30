class DeviceTypesController < ApplicationController
  before_action :set_device_model, only: [:show]

  # GET /device_types
  def index
    @device_types = DeviceType.all
  end

  # GET /device_types/1
  def show; end

  private

  def set_device_model
    @device_type = DeviceType.find(params[:id])
  end
end
