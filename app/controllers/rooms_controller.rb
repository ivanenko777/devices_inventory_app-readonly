class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  before_action only: [:new, :create, :edit, :update] do
    @offices_for_select = Office.all
  end

  # GET /rooms
  def index
    # @rooms = Room.all
    @filter_params = filter_params
    @filter_offices = Office.all

    @rooms = Room.where(nil)
    
    @rooms = @rooms.filter_by_is_active(params[:filter_active]) if params[:filter_active].present?
    @rooms = @rooms.filter_by_office_id(params[:filter_office]) if params[:filter_office].present?
    @rooms = @rooms.filter_by_room_name_contains(params[:filter_room]) if params[:filter_room].present?
  end

  # GET /rooms/1
  def show; end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.is_active = true if !@room.is_active.present?
    @room.office_id = params[:office] if params[:office].present?
  end

  # POST /rooms
  def create
    @room = Room.new(rooms_params)

    if @room.save && params[:commit] == 'Create Room and New'
      redirect_to new_room_path(office: @room), notice: 'Room was successfully created.'
    elsif @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  # GET /rooms/1/edit
  def edit; end

  # PATCH/PUT /rooms
  def update
    if @room.update(rooms_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully deleted.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:office_id, :name, :is_active)
  end

  def filter_params
    keys = :filter_active, :filter_office, :filter_room
    params.permit(keys)
  end
end
