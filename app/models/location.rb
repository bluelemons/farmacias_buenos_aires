class Location < ActiveRecord::Base

  geocoded_by :address do |location, results|
    if result = results.first
      bounds = result.geometry['bounds']
      location.bounds = [
        [ bounds['southwest']['lat'], bounds['southwest']['lng'] ],
        [ bounds['northeast']['lat'], bounds['northeast']['lng'] ]
      ]
      location.latitude  = result.latitude
      location.longitude = result.longitude
      result.coordinates
    end
  end

  after_create :geocode

  has_many :places

  serialize :bounds
end
