class OfficesController < ApplicationController
  before_action :set_office, only: [:show]

  # GET /offices
  def index
    @offices = Office.all
  end

  # GET /offices/1
  def show; end

  private

  def set_office
    @office = Office.find(params[:id])
  end
end
