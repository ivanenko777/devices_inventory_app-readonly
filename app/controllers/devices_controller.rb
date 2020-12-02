class DevicesController < ApplicationController

  # GET /devices
  def index
    @devices = Device.includes(:device_model, room: :office).all
  end
end
