json.array!(@places) do |place|
  json.extract! place, :id, :address, :latitude, :longitude, :location_id
end
