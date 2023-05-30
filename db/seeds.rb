# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(first_name: "yolo", last_name: "once", email: "aaaaa@gmail.com", password: "solo2123")
Plane.create( model: "Boeing 747", pax_capacity: 420, fh_price: 16_000, fh_range: 500, location: "London", user_id: 1 )
