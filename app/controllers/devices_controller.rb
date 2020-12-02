class DevicesController < ApplicationController
  before_action :set_device, only: [:show]

  # GET /devices
  def index
    @devices = Device.includes(:device_model, room: :office).all
  end

  # GET /devices/1
  def show; end

  private

  def set_device
    @device = Device.find(params[:id])
  end
end
