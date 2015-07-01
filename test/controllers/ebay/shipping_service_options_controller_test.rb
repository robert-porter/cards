require 'test_helper'

class Ebay::ShippingServiceOptionsControllerTest < ActionController::TestCase
  setup do
    @ebay_shipping_service_option = ebay_shipping_service_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebay_shipping_service_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebay_shipping_service_option" do
    assert_difference('Ebay::ShippingServiceOption.count') do
      post :create, ebay_shipping_service_option: { 16,: @ebay_shipping_service_option.16,, 2: @ebay_shipping_service_option.2, : @ebay_shipping_service_option., scale: @ebay_shipping_service_option.scale, shipping_service_cost: @ebay_shipping_service_option.shipping_service_cost, shipping_service_id: @ebay_shipping_service_option.shipping_service_id }
    end

    assert_redirected_to ebay_shipping_service_option_path(assigns(:ebay_shipping_service_option))
  end

  test "should show ebay_shipping_service_option" do
    get :show, id: @ebay_shipping_service_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebay_shipping_service_option
    assert_response :success
  end

  test "should update ebay_shipping_service_option" do
    patch :update, id: @ebay_shipping_service_option, ebay_shipping_service_option: { 16,: @ebay_shipping_service_option.16,, 2: @ebay_shipping_service_option.2, : @ebay_shipping_service_option., scale: @ebay_shipping_service_option.scale, shipping_service_cost: @ebay_shipping_service_option.shipping_service_cost, shipping_service_id: @ebay_shipping_service_option.shipping_service_id }
    assert_redirected_to ebay_shipping_service_option_path(assigns(:ebay_shipping_service_option))
  end

  test "should destroy ebay_shipping_service_option" do
    assert_difference('Ebay::ShippingServiceOption.count', -1) do
      delete :destroy, id: @ebay_shipping_service_option
    end

    assert_redirected_to ebay_shipping_service_options_path
  end
end
