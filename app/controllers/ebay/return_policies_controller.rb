class Ebay::ReturnPoliciesController < ApplicationController
  before_action :set_ebay_return_policy, only: [:show, :edit, :update, :destroy]

  # GET /ebay/return_policies
  # GET /ebay/return_policies.json
  def index
    @ebay_return_policies = Ebay::ReturnPolicy.all
  end

  # GET /ebay/return_policies/1
  # GET /ebay/return_policies/1.json
  def show
  end

  # GET /ebay/return_policies/new
  def new
    @ebay_return_policy = Ebay::ReturnPolicy.new
  end

  # GET /ebay/return_policies/1/edit
  def edit
  end

  # POST /ebay/return_policies
  # POST /ebay/return_policies.json
  def create
    @ebay_return_policy = Ebay::ReturnPolicy.new(ebay_return_policy_params)

    respond_to do |format|
      if @ebay_return_policy.save
        format.html { redirect_to @ebay_return_policy, notice: 'Return policy was successfully created.' }
        format.json { render :show, status: :created, location: @ebay_return_policy }
      else
        format.html { render :new }
        format.json { render json: @ebay_return_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebay/return_policies/1
  # PATCH/PUT /ebay/return_policies/1.json
  def update
    respond_to do |format|
      if @ebay_return_policy.update(ebay_return_policy_params)
        format.html { redirect_to @ebay_return_policy, notice: 'Return policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebay_return_policy }
      else
        format.html { render :edit }
        format.json { render json: @ebay_return_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebay/return_policies/1
  # DELETE /ebay/return_policies/1.json
  def destroy
    @ebay_return_policy.destroy
    respond_to do |format|
      format.html { redirect_to ebay_return_policies_url, notice: 'Return policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebay_return_policy
      @ebay_return_policy = Ebay::ReturnPolicy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebay_return_policy_params
      params.require(:ebay_return_policy).permit(:name, :description, :refund_option, :returns_accepted_option, :returns_within_option, :shipping_cost_paid_by)
    end
end
