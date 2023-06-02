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

first_names = [
  "Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "Elijah", "Charlotte", "William", "Sophia",
  "James", "Amelia", "Benjamin", "Isabella", "Lucas", "Mia", "Henry", "Evelyn", "Alexander", "Harper",
  "Michael", "Abigail", "Daniel", "Emily", "Matthew", "Elizabeth", "Aiden", "Sofia", "Joseph", "Ella",
  "Jackson", "Avery", "Samuel", "Scarlett", "Sebastian", "Grace", "David", "Chloe", "Carter", "Victoria",
  "Wyatt", "Riley", "John", "Zoe", "Owen", "Hannah", "Jack", "Nora", "Luke", "Lily"
]

puts 'Creating user db'
count = 1
10.times do
  user = User.new(
    first_name: first_names.sample,
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

# changes jpeg to jpg
pictures = [
  "https://images.prismic.io/privatefly/9723c90f81d19c285d324a77d3b1f6f7657eeeca_legacy-650-privatefly-aa9745.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/NmY4ODJjYjEtNmE2Ny00OGI3LTg0MGEtOWE5NjU2OTU5MWIw_falcon-7x-privatefly-aa9723.jpg?auto=compress,format&rect=0,0,846,564&w=846&h=564",
  "https://images.prismic.io/privatefly/83bf0c77-b263-4271-ad20-168ef6b0c207_A320-Prestige-PrivateFly-AA1587.jpeg?auto=compress,format&rect=0,0,594,396&w=846&h=564",
  "https://images.prismic.io/privatefly/bb86c2e82007227aceff717b0c5a0aac77d3fadf_gulfstream-g450-privatefly-aa9817.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/91a07c2fccf016266e2b4aac2a9c2cd62fc8c238_challenger-850-privatefly-aa9668.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/848e6a1742961dea2f7029e96c140e2603e2ad2a_cessna-citation-longitude-privatefly-aa9631.jpg?auto=compress,format",
  "https://images.prismic.io/privatefly/f9b23fc1dc2893ec87a5c55260e47ccc2c802c2a_bombardier-global-6000-privatefly-aa9562.jpg?auto=compress,format",
  "app/assets/images/planes_seed/seed_1.jpg",
  "app/assets/images/planes_seed/seed_2.jpg",
  "app/assets/images/planes_seed/seed_3.jpg",
  "app/assets/images/planes_seed/seed_4.jpg",
  "app/assets/images/planes_seed/seed_5.jpg",
  "app/assets/images/planes_seed/seed_6.jpg",
  "app/assets/images/planes_seed/seed_7.jpg",
  "app/assets/images/planes_seed/seed_8.jpg",
  "app/assets/images/planes_seed/seed_9.jpg",
  "app/assets/images/planes_seed/seed_11.jpg",
  "app/assets/images/planes_seed/seed_12.jpg",
  "app/assets/images/planes_seed/seed_13.jpg",
  "app/assets/images/planes_seed/seed_14.jpg"
]
# airport = ['LHR', 'STN', 'GTW', 'LTN', 'LCY']

5.times do
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
puts "Planes data base created"

# booking_seeding
puts 'Creating bookings db'
count = 1
Plane.all.each do |plane|
  4.times do
    user = User.find(rand(1..(User.all.length - 1)))
    Booking.create(
      total_hours: plane.fh_range,
      total_price: (plane.fh_price * plane.fh_range),
      date: Date.today,
      user_id: user.id,
      plane_id: plane.id
    )
    count += 1
    puts "created #{Booking.count} users"
  end
end

puts 'Bookings data base created'
# review_seeding

puts 'Creating reviews db'
count = 1
review_content = [
  "My seat  perfectly cushioned by my $3,000 suit trousers. This is style",
  "I never want to travel alongside commoners again.",
  "I've never burned so much CO2 in such short a time, I feel so powerful",
  "My plane passed Elon's over Florida, I gave him a wave!",
  "The increased turbulence and fear of death was exhilirating!",
  "I took my seatbelt off before the sign, and no one told me off. Freedom!",
  "My family and I have never been more aware of our wealth. Thanks Ready Jet Go!",
  "This plane changed my life.",
  "Me and the pilot took turns doing barrel rolls",
  "I walked straight onto the plane with over 100ml of fluids. Never flying public again!",
  "I screamed the whole way. No one looked at me weirdly!",
  "I asked the plane to weave in between buildings and we almost crashed. It was awesome!",
  "I. Am. Elite.",
  "Finally, I'm able to put some distance between myself and the poor!",
  "Take that, environment!",
  "I'm now able to bribe politicians in record time. God bless Ready Jet Go!"
]

review_rating = [4, 5]

Booking.all.each do |booking|
  Review.create(
    content: review_content.sample,
    booking_id: booking.id,
    rating: review_rating.sample
  )
  count += 1
  puts "created #{Review.count} reviews"
end

puts 'Reviews data base created'
