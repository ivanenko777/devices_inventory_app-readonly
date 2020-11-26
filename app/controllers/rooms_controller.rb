class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  def show; end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
