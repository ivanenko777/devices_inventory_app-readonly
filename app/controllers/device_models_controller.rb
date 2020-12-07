class DeviceModelsController < ApplicationController
  before_action :set_device_model, only: [:show, :edit, :update, :destroy]

  before_action only: [:new, :create, :edit, :update] do
    @device_types_for_select = DeviceType.all
    @device_manufacturers_for_select = DeviceManufacturer.all
  end

  # GET /device_models/index
  def index
    @filter_params = filter_params
    @filter_device_types = DeviceType.all
    @filter_device_manufacturers = DeviceManufacturer.all
    @order_by = order_by_values

    @device_models = DeviceModel.includes(:device_type, :device_manufacturer).where(nil)

    # FILTER
    @device_models = @device_models.filter_by_is_active(params[:filter_active]) if params[:filter_active].present?
    @device_models = @device_models.filter_by_device_type_id(params[:filter_device_type]) if params[:filter_device_type].present?
    @device_models = @device_models.filter_by_device_manufacturer_id(params[:filter_device_manufacturer]) if params[:filter_device_manufacturer].present?
    @device_models = @device_models.filter_by_device_model_name_contains(params[:filter_model]) if params[:filter_model].present?

    # ORDER
    @device_models = case params[:order_by]
                     when 'model_name_asc'
                       @device_models.order_by_device_model_name_asc
                     when 'model_name_desc'
                       @device_models.order_by_device_model_name_desc
                     when 'type_name_asc'
                       @device_models.order_by_device_type_name_asc
                     when 'type_name_desc'
                       @device_models.order_by_device_type_name_desc
                     when 'manufacturer_name_asc'
                       @device_models.order_by_device_manufacturer_name_asc
                     when 'manufacturer_name_desc'
                       @device_models.order_by_device_manufacturer_name_desc
                     else
                       @device_models.order_by_default
                     end
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
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Device model not found.'
    redirect_to action: :index
  end

  def device_model_params
    params.require(:device_model).permit(:device_type_id, :device_manufacturer_id, :name, :is_active)
  end

  def filter_params
    keys = :filter_active, :filter_device_type, :filter_device_manufacturer, :filter_model, :order_by
    params.permit(keys)
  end

  def order_by_values
    {model_name_asc: 'Model ASC', model_name_desc: 'Model DESC',
     type_name_asc: 'Type ASC', type_name_desc: 'Type DESC',
     manufacturer_name_asc: 'Manufacturer ASC', manufacturer_name_desc: 'Manufacturer DESC'}
  end
end
