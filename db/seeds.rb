# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users and lives first
lives = []

#eitan i have trimed down the migrations to only what was needed for seeding
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  domain_names = ['@gmail.com', '@hotmail.com', '@yahoo.com', '@icloud.com']
  price_per_day = Faker::Commerce.price(range: 50.0..500.0)

  user = User.create!({
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}#{domain_names.sample}",
    password: "password123",
    is_host: [true, false].sample
  })

  life = Life.create!({
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    address: Faker::Address.full_address,
    price_per_day: price_per_day,
    status: ["Available", "Booked", "Unavailable"].sample,
    user_id: User.where(is_host: true).sample&.id || user.id,
  })

  lives << life
end

# Create bookings after all users are created
non_host_users = User.where(is_host: false)

lives.each do |life|
  # Create 1 booking for each life
  booking_length = rand(1..14)  # Number of days as integer
  start_date = Faker::Date.between(from: 1.month.from_now, to: 6.months.from_now)
  end_date = start_date + booking_length.days

  Booking.create!({
    start_date: start_date,
    end_date: end_date,
    user_id: non_host_users.sample.id,
    life_id: life.id,
    total_price: life.price_per_day * booking_length
  })

end
