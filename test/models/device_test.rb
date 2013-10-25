require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

  setup do
    @device_example = {
      name: 'jason.pc',
      wired_mac: '',
      wireless_mac: '11:23:99:99:89:ab',
      network_support: 'active',
      security_alert: ''
    }
  end

  test "should be invalid if no name, no network support or no mac address" do
    device = Device.new
    assert !device.valid?
    [:name, :network_support].each do |f|
      assert device.errors.keys.include? f
    end
  end

  test "should be valid if name, network support and mac address" do
    device = Device.new(@device_example)
    assert device.valid?
  end

  test "should be invalid if name exists already" do
    device = Device.new(@device_example)
    device.wireless_mac = '99:23:45:67:89:ab'
    device.save
    device2 = Device.new(@device_example)
    assert !device2.valid?
  end

  test "should be invalid if mac address exists already" do
    device = Device.new(@device_example)
    device.name = 'unique'
    device.save
    device2 = Device.new(@device_example)
    assert !device2.valid?
  end

  test "should be valid if multiple devices have blank mac addresses" do
    device = Device.new(@device_example)
    device.name = 'hi'
    device.wireless_mac = '99:23:45:67:89:ab'
    device.save
    device2 = Device.new(@device_example)
    assert device2.valid?
  end

  test "should be invalid if mac address doesn't follow the IEEE 802 format" do
    device = Device.new(@device_example)
    device.wireless_mac = '123'
    assert !device.valid?
    device.wireless_mac = 'hello'
    assert !device.valid?
    device.wireless_mac = 'aa:bb:cc:dd:ee-12'
    assert device.valid?
    device.wireless_mac = 'aa:bb:cc:dd:ee:1'
    assert !device.valid?
    device.wireless_mac = 'aa-bb-2-dd-ee-12'
    assert !device.valid?
    device.wireless_mac = 'aa:bb:cc:dd:ee:fg'
    assert !device.valid?
    device.wireless_mac = 'a1-2b:c3-4d:e5-6f'
    assert device.valid?
  end

end
