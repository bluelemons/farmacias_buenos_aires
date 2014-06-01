class Place < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode

  belongs_to :location
  belongs_to :network

  def lat
    latitude
  end

  def lng
    longitude
  end

end
