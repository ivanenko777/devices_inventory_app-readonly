class DeviceManufacturersController < ApplicationController

  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /device_manufacturers
  def index
    @manufacturers = DeviceManufacturer.all
  end

  # GET /device_manufacturers/1
  def show; end

  # GET /device_manufacturers/new
  def new
    @manufacturer = DeviceManufacturer.new
  end

  # POST /device_manufacturers
  def create
    @manufacturer = DeviceManufacturer.new(device_manufacturer_params)
    if @manufacturer.save
      redirect_to @manufacturer, notice: 'Device manufacturer was successfully created.'
    else
      render :new
    end
  end

  # GET /device_manufacturers/1/edit
  def edit; end

  # PATCH/PUT /device_manufacturers
  def update
    if @manufacturer.update(device_manufacturer_params)
      redirect_to @manufacturer, notice: 'Device manufacturer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /device_manufacturer/1
  def destroy
    @manufacturer.destroy
    redirect_to device_manufacturers_url, notice: 'Device manufacturer was successfully deleted.'
  end

  private

  def set_manufacturer
    @manufacturer = DeviceManufacturer.find(params[:id])
  end

  def device_manufacturer_params
    params.require(:device_manufacturer).permit(:name)
  end
end
