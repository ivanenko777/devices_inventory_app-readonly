class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]

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
      redirect_to @office, notice: 'Office was successfully created.'
    else
      render :new
    end
  end

  # GET /offices/1/edit
  def edit; end

  # PATCH/PUT /offices/1
  def update
    if @office.update(office_params)
      redirect_to @office, notice: 'Office was successfully updates.'
    else
      render :edit
    end
  end

  # DELETE /offices/1
  def destroy
    @office.destroy
    redirect_to offices_url, notice: 'Office was successfully deleted.'
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :address, :is_active)
  end
end
