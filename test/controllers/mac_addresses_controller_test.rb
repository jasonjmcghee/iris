require 'test_helper'

class MacAddressesControllerTest < ActionController::TestCase
  setup do
    @mac_address = mac_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mac_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mac_address" do
    assert_difference('MacAddress.count') do
      post :create, mac_address: {  }
    end

    assert_redirected_to mac_address_path(assigns(:mac_address))
  end

  test "should show mac_address" do
    get :show, id: @mac_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mac_address
    assert_response :success
  end

  test "should update mac_address" do
    patch :update, id: @mac_address, mac_address: {  }
    assert_redirected_to mac_address_path(assigns(:mac_address))
  end

  test "should destroy mac_address" do
    assert_difference('MacAddress.count', -1) do
      delete :destroy, id: @mac_address
    end

    assert_redirected_to mac_addresses_path
  end
end
