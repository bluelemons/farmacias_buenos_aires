json.array!(@places) do |place|
  json.extract! place, :id, :address, :latitude, :longitude, :location_id_id
  json.url place_url(place, format: :json)
end
