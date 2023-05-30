# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning data base'
Plane.destroy_all
puts "Creating plane model"
planes = Plane.create!(
  [{ model: 'Cessna 510', location: 'LHR', pax_capacity: 4, fh_range: 3, fh_price: 1700, user_id: 1 },
    { model: 'Learjet', location: 'LHR', pax_capacity: 8, fh_range: 5, fh_price: 2800, user_id:2 }]
)
puts "#{planes.length} planse created"
