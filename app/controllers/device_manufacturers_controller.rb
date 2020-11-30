class DeviceManufacturersController < ApplicationController

  before_action :set_manufacturer, only: [:show]

  def index
    @manufacturers = DeviceManufacturer.all
  end

  def show; end

  private

  def set_manufacturer
    @manufacturer = DeviceManufacturer.find(params[:id])
  end
end
