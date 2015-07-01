class Ebay::ShippingServicesController < ApplicationController
  before_action :set_ebay_shipping_service, only: [:show, :edit, :update, :destroy]

  # GET /ebay/shipping_services
  # GET /ebay/shipping_services.json
  def index
    @ebay_shipping_services = Ebay::ShippingService.all
  end

  # GET /ebay/shipping_services/1
  # GET /ebay/shipping_services/1.json
  def show
  end

  # GET /ebay/shipping_services/new
  def new
    @ebay_shipping_service = Ebay::ShippingService.new
  end

  # GET /ebay/shipping_services/1/edit
  def edit
  end

  # POST /ebay/shipping_services
  # POST /ebay/shipping_services.json
  def create
    @ebay_shipping_service = Ebay::ShippingService.new(ebay_shipping_service_params)

    respond_to do |format|
      if @ebay_shipping_service.save
        format.html { redirect_to @ebay_shipping_service, notice: 'Shipping service was successfully created.' }
        format.json { render :show, status: :created, location: @ebay_shipping_service }
      else
        format.html { render :new }
        format.json { render json: @ebay_shipping_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebay/shipping_services/1
  # PATCH/PUT /ebay/shipping_services/1.json
  def update
    respond_to do |format|
      if @ebay_shipping_service.update(ebay_shipping_service_params)
        format.html { redirect_to @ebay_shipping_service, notice: 'Shipping service was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebay_shipping_service }
      else
        format.html { render :edit }
        format.json { render json: @ebay_shipping_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebay/shipping_services/1
  # DELETE /ebay/shipping_services/1.json
  def destroy
    @ebay_shipping_service.destroy
    respond_to do |format|
      format.html { redirect_to ebay_shipping_services_url, notice: 'Shipping service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebay_shipping_service
      @ebay_shipping_service = Ebay::ShippingService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebay_shipping_service_params
      params.require(:ebay_shipping_service).permit(:name)
    end
end
