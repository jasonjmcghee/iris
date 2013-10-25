json.array!(@devices) do |device|
  json.extract! device, :name, :wired_mac, :wireless_mac, :network_support, :security_alert
  json.url device_url(device, format: :json)
end
