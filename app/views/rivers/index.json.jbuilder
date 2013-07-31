json.array!(@rivers) do |river|
  json.extract! river, :site_name, :site_code, :refresh_time, :latitude, :longitude, :srs, :county_id, :cfs_value, :state
  json.url river_url(river, format: :json)
end
