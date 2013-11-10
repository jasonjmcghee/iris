json.array!(@user_macs) do |user_mac|
  json.extract! user_mac, 
  json.url user_mac_url(user_mac, format: :json)
end
