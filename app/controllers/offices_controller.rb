class OfficesController < ApplicationController

  # GET /offices
  def index
    @offices = Office.all
  end
end
