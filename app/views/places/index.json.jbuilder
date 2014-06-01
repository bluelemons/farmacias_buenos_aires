json.array!(@places) do |place|
  json.extract! place, :id, :address, :lat, :lng, :location_id

  json.infowindow place.name
end
