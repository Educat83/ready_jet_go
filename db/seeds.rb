require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Cleaning users data base'
User.destroy_all
puts 'Cleaning plane data base'
Plane.destroy_all

# User creation
puts 'Creating user db'
count = 1
10.times do
  user = User.new(
    first_name: "user name#{count}",
    last_name: "user surname#{count}",
    email: "something#{count}@hotmail.com",
    password: "123456"
  )
  user.save
  count += 1
  puts "created #{User.count} users"
end
puts 'User data base created'

# Plane seeding

puts "Creating plane model"

plane_names = [
  "Cessna",
  'Learjet',
  "Airbus",
  "Boeing",
  'Bombardier',
  'Gulfstream'
]

plane_number = [
  320,
  330,
  340,
  510,
  520,
  560,
  737,
  747,
  787
]
pax_number = [4, 6, 6, 8, 8, 13, 13, 14, 14, 18, 30]

range_number = [3, 4, 5, 6, 7, 8, 9, 13]

price_figure = (1500..8000).to_a

pictures = [
  "https://images.prismic.io/privatefly/9723c90f81d19c285d324a77d3b1f6f7657eeeca_legacy-650-privatefly-aa9745.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/NmY4ODJjYjEtNmE2Ny00OGI3LTg0MGEtOWE5NjU2OTU5MWIw_falcon-7x-privatefly-aa9723.jpg?auto=compress,format&rect=0,0,846,564&w=846&h=564",
  "https://images.prismic.io/privatefly/83bf0c77-b263-4271-ad20-168ef6b0c207_A320-Prestige-PrivateFly-AA1587.jpeg?auto=compress,format&rect=0,0,594,396&w=846&h=564",
  "https://images.prismic.io/privatefly/bb86c2e82007227aceff717b0c5a0aac77d3fadf_gulfstream-g450-privatefly-aa9817.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/91a07c2fccf016266e2b4aac2a9c2cd62fc8c238_challenger-850-privatefly-aa9668.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/848e6a1742961dea2f7029e96c140e2603e2ad2a_cessna-citation-longitude-privatefly-aa9631.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/f9b23fc1dc2893ec87a5c55260e47ccc2c802c2a_bombardier-global-6000-privatefly-aa9562.jpg?auto=compress,format",
  "app/assets/images/planes_seed/seed_1.jpg",
  "app/assets/images/planes_seed/seed_2.jpeg",
  "app/assets/images/planes_seed/seed_3.jpg",
  "app/assets/images/planes_seed/seed_4.jpeg",
  "app/assets/images/planes_seed/seed_5.jpg",
  "app/assets/images/planes_seed/seed_6.jpg",
  "app/assets/images/planes_seed/seed_7.jpg",
  "app/assets/images/planes_seed/seed_8.jpeg",
  "app/assets/images/planes_seed/seed_9.jpeg",
  "app/assets/images/planes_seed/seed_10.jpg",
  "app/assets/images/planes_seed/seed_11.jpg",
  "app/assets/images/planes_seed/seed_11.jpeg",
  "app/assets/images/planes_seed/seed_12.jpeg",
  "app/assets/images/planes_seed/seed_13.jpeg",
  "app/assets/images/planes_seed/seed_14.jpeg"
]
# airport = ['LHR', 'STN', 'GTW', 'LTN', 'LCY']

50.times do
  plane = Plane.new(
    model: "#{plane_names.sample} #{plane_number.sample}",
    location: 'LHR',
    pax_capacity: pax_number.sample,
    fh_range: range_number.sample,
    fh_price: price_figure.sample,
    user_id: User.all.sample.id
  )
  file = URI.open(pictures.sample)
  plane.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  plane.save!
  puts "Created #{Plane.count} planes"
end
puts "Planes created"
