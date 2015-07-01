class Ebay::ShippingServiceOptionsController < ApplicationController
  before_action :set_ebay_shipping_service_option, only: [:show, :edit, :update, :destroy]

  # GET /ebay/shipping_service_options
  # GET /ebay/shipping_service_options.json
  def index
    @ebay_shipping_service_options = Ebay::ShippingServiceOption.all
  end

  # GET /ebay/shipping_service_options/1
  # GET /ebay/shipping_service_options/1.json
  def show
  end

  # GET /ebay/shipping_service_options/new
  def new
    @ebay_shipping_service_option = Ebay::ShippingServiceOption.new
  end

  # GET /ebay/shipping_service_options/1/edit
  def edit
  end

  # POST /ebay/shipping_service_options
  # POST /ebay/shipping_service_options.json
  def create
    @ebay_shipping_service_option = Ebay::ShippingServiceOption.new(ebay_shipping_service_option_params)

    respond_to do |format|
      if @ebay_shipping_service_option.save
        format.html { redirect_to @ebay_shipping_service_option, notice: 'Shipping service option was successfully created.' }
        format.json { render :show, status: :created, location: @ebay_shipping_service_option }
      else
        format.html { render :new }
        format.json { render json: @ebay_shipping_service_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebay/shipping_service_options/1
  # PATCH/PUT /ebay/shipping_service_options/1.json
  def update
    respond_to do |format|
      if @ebay_shipping_service_option.update(ebay_shipping_service_option_params)
        format.html { redirect_to @ebay_shipping_service_option, notice: 'Shipping service option was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebay_shipping_service_option }
      else
        format.html { render :edit }
        format.json { render json: @ebay_shipping_service_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebay/shipping_service_options/1
  # DELETE /ebay/shipping_service_options/1.json
  def destroy
    @ebay_shipping_service_option.destroy
    respond_to do |format|
      format.html { redirect_to ebay_shipping_service_options_url, notice: 'Shipping service option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebay_shipping_service_option
      @ebay_shipping_service_option = Ebay::ShippingServiceOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebay_shipping_service_option_params
      params.require(:ebay_shipping_service_option).permit(:shipping_service_id, :shipping_service_cost)
    end
end
