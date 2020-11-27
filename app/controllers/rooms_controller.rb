class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  before_action only: [:new, :create] do
    @offices_for_select = Office.all
  end

  # GET /rooms
  def index
    @rooms = Room.all
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

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:office_id, :name, :is_active)
  end
end
