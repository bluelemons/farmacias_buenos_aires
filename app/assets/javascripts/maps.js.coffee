$(document).ready ->

  lat = $('body').data("lat");
  lng = $('body').data("lng");
  location_id = $('body').data('location_id')

  handler = Gmaps.build("Google")
  handler.buildMap
    provider:
      disableDefaultUI: true

    # pass in other Google Maps API options here
    internal:
      id: "map"
  , ->

    $.get "/locations/#{ location_id }/places.json", (data) ->
      markers = handler.addMarkers(data);
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
