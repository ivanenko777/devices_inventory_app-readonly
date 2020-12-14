class DeviceTypesController < ApplicationController
  before_action :set_device_type, only: [:show, :edit, :update, :destroy]

  # GET /device_types
  def index
    @device_types = DeviceType.all
  end

  # GET /device_types/1
  def show; end

  # GET /device_types/new
  def new
    @device_type = DeviceType.new
  end

  # POST /device_types
  def create
    @device_type = DeviceType.new(device_type_params)
    if @device_type.save
      redirect_to @device_type, notice: 'Device type was successfully created.'
    else
      render :new
    end
  end

  # GET /device_types/1/edit
  def edit; end

  # PATCH/PUT /device_types
  def update
    if @device_type.update(device_type_params)
      redirect_to @device_type, notice: 'Device type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /device_types/1
  def destroy
    @device_type.destroy
    redirect_to device_types_path, notice: 'Device type was successfully deleted.'
  rescue ActiveRecord::StatementInvalid
    flash[:alert] = "Device type can't be deleted."
    redirect_to @device_type
  end

  private

  def set_device_type
    @device_type = DeviceType.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Device type not found.'
    redirect_to action: :index
  end

  def device_type_params
    params.require(:device_type).permit(:sys_name, :name)
  end
end
