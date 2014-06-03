class Place < ActiveRecord::Base

  geocoded_by :address

  belongs_to :location
  belongs_to :network

  def lat
    latitude
  end

  def lng
    longitude
  end

  def geocode_with_bounds
    return [ latitude, longitude ] if latitude && longitude && within_bounds?

    results = Geocoder.search address, bounds: location.bounds
    if result = results.first
      self.latitude  = result.latitude
      self.longitude = result.longitude
      sleep 0.5
      result.coordinates
    end
  end

  def within_bounds?
    bounds = location.bounds
    latitude > bounds[0][0] && latitude < bounds[1][0] &&
    longitude > bounds[0][1] && longitude < bounds[1][1]
  end

end
