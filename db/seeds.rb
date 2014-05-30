# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create address: "Buenos Aires, Argentina"

CSV.foreach(Rails.root.join "db/csv/farmacias.csv") do |row|
  puts Place.create address: "#{ row[4] }, #{ row[0] }, Argentina", location: Location.first
end
