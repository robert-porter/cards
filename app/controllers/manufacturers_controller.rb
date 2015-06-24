class ManufacturersController < ApplicationController
  def create
    @manufacturer = Manufacturer.new manufacturer_params
    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to manufacturers_path }
        format.js   {}
      else
        format.html { redirect_to manufacturers_path }
      end
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update manufacturer_params
      respond_to do |format|
        format.html { redirect_to manufacturers_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to manufacturers_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def index
    @manufacturers = Manufacturer.all
    @manufacturer = Manufacturer.new
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end

