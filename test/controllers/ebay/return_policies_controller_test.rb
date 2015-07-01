require 'test_helper'

class Ebay::ReturnPoliciesControllerTest < ActionController::TestCase
  setup do
    @ebay_return_policy = ebay_return_policies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebay_return_policies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebay_return_policy" do
    assert_difference('Ebay::ReturnPolicy.count') do
      post :create, ebay_return_policy: { description: @ebay_return_policy.description, name: @ebay_return_policy.name, refund_option: @ebay_return_policy.refund_option, returns_accepted_option: @ebay_return_policy.returns_accepted_option, returns_within_option: @ebay_return_policy.returns_within_option, shipping_cost_paid_by: @ebay_return_policy.shipping_cost_paid_by }
    end

    assert_redirected_to ebay_return_policy_path(assigns(:ebay_return_policy))
  end

  test "should show ebay_return_policy" do
    get :show, id: @ebay_return_policy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebay_return_policy
    assert_response :success
  end

  test "should update ebay_return_policy" do
    patch :update, id: @ebay_return_policy, ebay_return_policy: { description: @ebay_return_policy.description, name: @ebay_return_policy.name, refund_option: @ebay_return_policy.refund_option, returns_accepted_option: @ebay_return_policy.returns_accepted_option, returns_within_option: @ebay_return_policy.returns_within_option, shipping_cost_paid_by: @ebay_return_policy.shipping_cost_paid_by }
    assert_redirected_to ebay_return_policy_path(assigns(:ebay_return_policy))
  end

  test "should destroy ebay_return_policy" do
    assert_difference('Ebay::ReturnPolicy.count', -1) do
      delete :destroy, id: @ebay_return_policy
    end

    assert_redirected_to ebay_return_policies_path
  end
end
