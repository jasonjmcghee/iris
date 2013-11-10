require 'test_helper'

class UserMacsControllerTest < ActionController::TestCase
  setup do
    @user_mac = user_macs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_macs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mac" do
    assert_difference('UserMac.count') do
      post :create, user_mac: {  }
    end

    assert_redirected_to user_mac_path(assigns(:user_mac))
  end

  test "should show user_mac" do
    get :show, id: @user_mac
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_mac
    assert_response :success
  end

  test "should update user_mac" do
    patch :update, id: @user_mac, user_mac: {  }
    assert_redirected_to user_mac_path(assigns(:user_mac))
  end

  test "should destroy user_mac" do
    assert_difference('UserMac.count', -1) do
      delete :destroy, id: @user_mac
    end

    assert_redirected_to user_macs_path
  end
end
