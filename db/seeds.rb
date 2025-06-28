
puts "Cleaning database..."
Booking.destroy_all
Life.destroy_all
User.destroy_all

job_titles = ["Mother", "Lawyer", "Fireman", "Police officer", "Teacher", "Artist", "Father", "Surgeon", "Prime minister", "Dog walker"]

puts "Creating users..."
lives = []

users = [{
    first_name: "jesse",
    last_name: "mayert",
    email: "jesse.mayert@gmail.com",
    password: "password123",
    is_host: false},
  {
    first_name: "terrance",
    last_name: "hessel",
    email: "terrance.hessel@gmail.com",
    password: "password123",
    is_host: false},
  {
    first_name: "lauren",
    last_name: "rau",
    email: "lauren.rau@hotmail.com",
    password: "password123",
    is_host: false},
  {
    first_name: "kraig",
    last_name: "bechtelar",
    email: "kraig.bechtelar@hotmail.com",
    password: "password123",
    is_host: false},
  {
    first_name: "ahmad",
    last_name: "feest",
    email: "ahmad.feest@yahoo.com",
    password: "password123",
    is_host: true},
  {
    first_name: "clair",
    last_name: "feeney",
    email: "clair.feeney@gmail.com",
    password: "password123",
    is_host: true},
  {
    first_name: "kazuko",
    last_name: "emmerich",
    email: "kazuko.emmerich@yahoo.com",
    password: "password123",
    is_host: true},
  {
    first_name: "lewis",
    last_name: "ledner",
    email: "lewis.ledner@yahoo.com",
    password: "password123",
    is_host: true},
  {
    first_name: "melani",
    last_name: "zboncak",
    email: "melani.zboncak@yahoo.com",
    password: "password123",
    is_host: false},
  {
    first_name: "tracey",
    last_name: "macgyver",
    email: "tracey.macgyver@yahoo.com",
    password: "password123",
    is_host: false},
  ]

users.each do |user|
  User.create!(user)
end

puts "Creating lives..."
host_users = User.where(is_host: true).to_a

10.times do |count|
  price_per_day = Faker::Commerce.price(range: 50.0..500.0)

  life = Life.create!({
    title: job_titles[count],
    description: Faker::Lorem.paragraph(sentence_count: 3),
    address: Faker::Address.full_address,
    price_per_day: price_per_day,
    status: "Available",
    user_id: host_users[count % host_users.length].id,
  })

  lives << life
end

puts "Creating bookings..."
non_host_users = User.where(is_host: false).to_a

lives.each_with_index do |life, index|
  booking_length = rand(1..14)
  start_date = Faker::Date.between(from: 1.month.from_now, to: 6.months.from_now)
  end_date = start_date + booking_length.days

  Booking.create!({
    start_date: start_date,
    end_date: end_date,
    user_id: non_host_users[index % non_host_users.length].id,
    life_id: life.id,
    total_price: life.price_per_day * booking_length
  })
end

puts "Seed completed! Created #{User.count} users, #{Life.count} lives, and #{Booking.count} bookings."
