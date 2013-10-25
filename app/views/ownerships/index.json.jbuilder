json.array!(@ownerships) do |ownership|
  json.extract! ownership, :user_email, :device_name
  json.url ownership_url(ownership, format: :json)
end
