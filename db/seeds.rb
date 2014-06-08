location = Location.where(address: "Buenos Aires, Argentina").first_or_create!
location.geocode
location.save!

['fefara', 'compania', 'asofar', 'farmasur'].each do |name|
  network = Network.where(name: name).first_or_create!

  puts network.inspect

  CSV.foreach(Rails.root.join "db/csv/#{name}.csv") do |row|
    place = Place.where(address: "#{ row[4] }, Buenos Aires, Argentina").first_or_create!
    place.location = location
    place.network  = network
    place.name     = row[3]
    place.geocode_with_bounds
    place.save! and print '·'
  end

  puts ''
end
