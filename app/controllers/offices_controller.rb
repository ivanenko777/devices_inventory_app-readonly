class OfficesController < ApplicationController
  before_action :set_office, only: [:show]

  # GET /offices
  def index
    @offices = Office.all
  end

  # GET /offices/1
  def show; end

  # GET /offices/new
  def new
    @office = Office.new
  end

  # POST /offices
  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to @office, notice: 'Office wa successfully created'
    else
      render :new
    end
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :address, :is_active)
  end
end
