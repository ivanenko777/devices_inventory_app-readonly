class DeviceManufacturersController < ApplicationController
  before_action :set_device_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /device_manufacturers
  def index
    @device_manufacturers = DeviceManufacturer.all
  end

  # GET /device_manufacturers/1
  def show; end

  # GET /device_manufacturers/new
  def new
    @device_manufacturer = DeviceManufacturer.new
  end

  # POST /device_manufacturers
  def create
    @device_manufacturer = DeviceManufacturer.new(device_manufacturer_params)
    if @device_manufacturer.save
      redirect_to @device_manufacturer, notice: 'Device manufacturer was successfully created.'
    else
      render :new
    end
  end

  # GET /device_manufacturers/1/edit
  def edit; end

  # PATCH/PUT /device_manufacturers
  def update
    if @device_manufacturer.update(device_manufacturer_params)
      redirect_to @device_manufacturer, notice: 'Device manufacturer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /device_manufacturer/1
  def destroy
    @device_manufacturer.destroy
    redirect_to device_manufacturers_url, notice: 'Device manufacturer was successfully deleted.'
  rescue ActiveRecord::StatementInvalid
    flash[:alert] = "Device manufacturer can't be deleted."
    redirect_to @device
  end

  private

  def set_device_manufacturer
    @device_manufacturer = DeviceManufacturer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Device manufacturer not found.'
    redirect_to action: :index
  end

  def device_manufacturer_params
    params.require(:device_manufacturer).permit(:name)
  end
end
