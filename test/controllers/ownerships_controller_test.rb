require 'test_helper'

class OwnershipsControllerTest < ActionController::TestCase
  setup do
    @ownership = ownerships(:one)
    user = User.new({name: 'merp', email: 'unique@me.com'})
    user.save
    device = Device.new({name: 'unique', wireless_mac: 'aa:aa:Aa:aa:aa:11', network_support: 'active' })
    device.save
    device2 = Device.new({name: 'unique2', wireless_mac: 'ca:aa:Aa:aa:aa:11', network_support: 'active' })
    device2.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ownerships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ownership" do
    assert_difference('Ownership.count') do
      post :create, ownership: { device_name: 'unique', user_email: 'unique@me.com' }
    end

    assert_redirected_to ownership_path(assigns(:ownership))
  end

  test "should show ownership" do
    get :show, id: @ownership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ownership
    assert_response :success
  end

  test "should update ownership" do
    patch :update, id: @ownership, ownership: { device_name: 'unique2', user_email: 'unique@me.com' }
    assert_redirected_to ownership_path(assigns(:ownership))
  end

  test "should destroy ownership" do
    assert_difference('Ownership.count', -1) do
      delete :destroy, id: @ownership
    end

    assert_redirected_to ownerships_path
  end
end
