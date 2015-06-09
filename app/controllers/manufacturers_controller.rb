class ManufacturersController < ApplicationController

  def create
    manufacturer = Manufacturer.new
    manufacturer.name = params[:name]
    manufacturer.save

    redirect_to(manufacturers_path)
  end

  def destroy
    manufacturer = Manufacturer.find(params[:name])
    manufacturer.destroy

    redirect_to(manufacturers_path)
  end

  def index
    @manufacturers = Manufacturer.all
  end
end
