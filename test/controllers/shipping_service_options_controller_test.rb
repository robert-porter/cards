require 'test_helper'

class ShippingServiceOptionsControllerTest < ActionController::TestCase
  setup do
    @shipping_service_option = shipping_service_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_service_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_service_option" do
    assert_difference('ShippingServiceOption.count') do
      post :create, shipping_service_option: { 16,: @shipping_service_option.16,, 2: @shipping_service_option.2, : @shipping_service_option., scale: @shipping_service_option.scale, shipping_service_cost: @shipping_service_option.shipping_service_cost, shipping_service_id: @shipping_service_option.shipping_service_id }
    end

    assert_redirected_to shipping_service_option_path(assigns(:shipping_service_option))
  end

  test "should show shipping_service_option" do
    get :show, id: @shipping_service_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_service_option
    assert_response :success
  end

  test "should update shipping_service_option" do
    patch :update, id: @shipping_service_option, shipping_service_option: { 16,: @shipping_service_option.16,, 2: @shipping_service_option.2, : @shipping_service_option., scale: @shipping_service_option.scale, shipping_service_cost: @shipping_service_option.shipping_service_cost, shipping_service_id: @shipping_service_option.shipping_service_id }
    assert_redirected_to shipping_service_option_path(assigns(:shipping_service_option))
  end

  test "should destroy shipping_service_option" do
    assert_difference('ShippingServiceOption.count', -1) do
      delete :destroy, id: @shipping_service_option
    end

    assert_redirected_to shipping_service_options_path
  end
end
