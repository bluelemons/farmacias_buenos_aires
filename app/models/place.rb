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
    results = Geocoder.search address, bounds: location.bounds
    if result = results.first
      self.latitude  = result.latitude
      self.longitude = result.longitude
      result.coordinates
    end
  end

end
