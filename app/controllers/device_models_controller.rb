class DeviceModelsController < ApplicationController
  before_action :set_device_model, only: [:show, :edit, :update, :destroy]

  before_action only: [:new, :create, :edit, :update] do
    @device_types_for_select = DeviceType.all
    @device_manufacturers_for_select = DeviceManufacturer.all
  end

  # GET /device_models/index
  def index
    @device_models = DeviceModel.includes(:device_type, :device_manufacturer).all
  end

  # GET /device_models/1
  def show; end

  # GET /device_models/new
  def new
    @device_model = DeviceModel.new
    @device_model.is_active = true if !@device_model.is_active.present?
  end

  # POST /device_models
  def create
    @device_model = DeviceModel.new(device_model_params)

    if @device_model.save
      redirect_to @device_model, notice: 'Device model was successfully created.'
    else
      render :new
    end
  end

  # GET /device_models/1/edit
  def edit; end

  # PATCH/PUT /device_models
  def update
    if @device_model.update(device_model_params)
      redirect_to @device_model, notice: 'Device model was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /device_models/1
  def destroy
    @device_model.destroy
    redirect_to device_models_url, notice: 'Device model was successfully deleted.'
  end

  private

  def set_device_model
    @device_model = DeviceModel.find(params[:id])
  end

  def device_model_params
    params.require(:device_model).permit(:device_type_id, :device_manufacturer_id, :name, :is_active)
  end
end
