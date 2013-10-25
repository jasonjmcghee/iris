require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  setup do
    @ownership_example = {
      device_name: 'unique',
      user_email: 'unique@me.com'
    }
  end

  test "should be invalid if no device name or user email" do
    ownership = Ownership.new
    assert !ownership.valid?
    [ :user_email, :device_name ].each do |f|
      assert ownership.errors.keys.include? f
    end
  end

  test "should only be valid if user and device exist in database" do
    user = User.new({name: 'merp', email: 'unique@me.com'})
    user.save
    device = Device.new({name: 'unique', wireless_mac: 'aa:aa:Aa:aa:aa:11', network_support: 'active' })
    device.save
    ownership = Ownership.new(@ownership_example)
    assert ownership.valid?
  end
end
