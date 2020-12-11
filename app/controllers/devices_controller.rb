class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :history]

  before_action only: [:new, :create, :edit, :update] do
    @device_models_for_select = DeviceModel.includes(:device_type, :device_manufacturer).order_by_default
    @rooms_for_select = Room.includes(:office).active
  end

  before_action only: [:edit, :update] do
    # active + current room (in inactive)
    @rooms_for_select |= Room.where(id: @device.room)
  end

  # GET /devices
  def index
    @filter_params = filter_params
    @filter_statuses = Device.statuses
    @filter_device_types = DeviceType.all
    @filter_device_manufacturers = DeviceManufacturer.all
    @filter_device_models = DeviceModel.includes(:device_manufacturer).all
    @filter_offices = Office.all
    @order_by = order_by_values

    @devices = Device.includes(device_model: [:device_type, :device_manufacturer], room: :office).where(nil)

    # FILTER
    @devices = if params[:filter_status] == 'all'
                 @devices
               elsif params[:filter_status].present?
                 @devices.filter_by_status(params[:filter_status])
               else
                 @devices.default_statuses
               end
    @devices = @devices.filter_by_device_type(params[:filter_device_type]) if params[:filter_device_type].present?
    @devices = @devices.filter_by_device_manufacturer(params[:filter_device_manufacturer]) if params[:filter_device_manufacturer].present?
    @devices = @devices.filter_by_device_model(params[:filter_device_model]) if params[:filter_device_model].present?
    @devices = @devices.filter_by_office(params[:filter_office]) if params[:filter_office].present?
    @devices = @devices.filter_by_serial_no_or_asset_no_contains(params[:filter_text]) if params[:filter_text].present?

    # ORDER
    @devices = case params[:order_by]
               when 'status_asc'
                 @devices.order_by_status_asc
               when 'status_desc'
                 @devices.order_by_status_desc
               when 'room_asc'
                 @devices.order_by_room_asc
               when 'room_desc'
                 @devices.order_by_room_desc
               when 'last_created'
                 @devices.order_by_last_created
               when 'last_updated'
                 @devices.order_by_last_updated
               else
                 @devices.order_by_default
               end
  end

  # GET /devices/1
  def show; end

  # GET /devices/new
  def new
    @device = Device.new
    @device.device_model_id = params[:device_model] if params[:device_model].present?
    @device.room_id = params[:room] if params[:room].present?
  end

  # POST /devices
  def create
    @device = Device.new(device_params)

    if @device.save
      if params[:commit] == 'Create and New'
        redirect_to new_device_path(device_model: @device.device_model_id, room: @device.room_id), notice: 'Device was successfully created.'
      else
        redirect_to @device, notice: 'Device was successfully created.'
      end
    else
      render :new
    end
  end

  # GET /devices/1/edit
  def edit; end

  # PATCH/PUT /devices
  def update
    if @device.update(device_params)
      redirect_to @device, notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /device/1
  def destroy
    # TODO: salyga pries destroy, pvz status ir t.t.
    @device.destroy
    redirect_to devices_url, notice: 'Device was successfully deleted.'
  rescue ActiveRecord::StatementInvalid
    flash[:alert] = "Device can't be deleted."
    redirect_to @device
  end

  # GET /device/1/history
  def history
    @device_history = DeviceHistory.includes(:created_by, room: :office).where(device_id: params[:id]).order(id: :desc)
    render :show
  end

  private

  def set_device
    @device = Device.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Device not found.'
    redirect_to action: :index
  end

  def device_params
    params.require(:device).permit(:device_model_id, :room_id, :serial_no, :asset_no, :status)
  end

  def filter_params
    keys = :filter_status, :filter_device_type, :filter_device_manufacturer, :filter_device_model, :filter_office, :filter_text, :order_by
    params.permit(keys)
  end

  def order_by_values
    {status_asc: 'Status ASC', status_desc: 'Status DESC',
     room_asc: 'Room ASC', room_desc: 'Room DESC',
     last_created: 'Last created', last_updated: 'Last updated'}
  end
end
