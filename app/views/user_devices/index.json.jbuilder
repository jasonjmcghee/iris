json.array!(@user_devices) do |user_device|
  json.extract! user_device, 
  json.url user_device_url(user_device, format: :json)
end
