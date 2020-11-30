class DeviceManufacturersController < ApplicationController

  before_action :set_manufacturer, only: [:show]

  def index
    @manufacturers = DeviceManufacturer.all
  end

  def show; end

  def new
    @manufacturer = DeviceManufacturer.new
  end

  def create
    @manufacturer = DeviceManufacturer.new(device_manufacturer_params)
    if @manufacturer.save
      redirect_to @manufacturer, notice: 'Device manufacturer was successfully created.'
    else
      render :new
    end
  end

  private

  def set_manufacturer
    @manufacturer = DeviceManufacturer.find(params[:id])
  end

  def device_manufacturer_params
    params.require(:device_manufacturer).permit(:name)
  end
end
