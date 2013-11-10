json.array!(@mac_addresses) do |mac_address|
  json.extract! mac_address, 
  json.url mac_address_url(mac_address, format: :json)
end
