# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location = Location.where(address: "Buenos Aires, Argentina").first_or_create!

['fefara', 'compania'].each do |name|
  network = Network.where(name: name).first_or_create!

  puts network.inspect

  CSV.foreach(Rails.root.join "db/csv/#{name}.csv") do |row|
    Place.where(address: "#{ row[4] }, Buenos Aires, Argentina").first_or_create! do |place|
      place.location = location
      place.network  = network
    end
    print '·'
  end

  puts ''
end
