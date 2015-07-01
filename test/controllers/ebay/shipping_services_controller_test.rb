require 'test_helper'

class Ebay::ShippingServicesControllerTest < ActionController::TestCase
  setup do
    @ebay_shipping_service = ebay_shipping_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebay_shipping_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebay_shipping_service" do
    assert_difference('Ebay::ShippingService.count') do
      post :create, ebay_shipping_service: { name: @ebay_shipping_service.name }
    end

    assert_redirected_to ebay_shipping_service_path(assigns(:ebay_shipping_service))
  end

  test "should show ebay_shipping_service" do
    get :show, id: @ebay_shipping_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebay_shipping_service
    assert_response :success
  end

  test "should update ebay_shipping_service" do
    patch :update, id: @ebay_shipping_service, ebay_shipping_service: { name: @ebay_shipping_service.name }
    assert_redirected_to ebay_shipping_service_path(assigns(:ebay_shipping_service))
  end

  test "should destroy ebay_shipping_service" do
    assert_difference('Ebay::ShippingService.count', -1) do
      delete :destroy, id: @ebay_shipping_service
    end

    assert_redirected_to ebay_shipping_services_path
  end
end
