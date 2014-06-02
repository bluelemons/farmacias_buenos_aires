json.array!(@places) do |place|
  json.extract! place, :id, :address, :lat, :lng, :location_id

  json.infowindow place.name
  json.picture({
    url: "/icon_#{ place.network.name }.png",
    width: 32,
    height: 37
  })
end
