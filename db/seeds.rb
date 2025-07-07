require 'faker'
require "open-uri"

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
    description_short: Faker::Lorem.paragraph(sentence_count: 1),
    description_long: Faker::Lorem.paragraph(sentence_count: 4),
    address: Faker::Address.full_address,
    price_per_day: price_per_day,
    status: "Available",
    user_id: host_users[count % host_users.length].id,
  })

  lives << life
end

puts "Linking images for Life models..."

data = {
  "Mother" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613513/mother_4_homd5e.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613513/mother_3_db4xqf.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613511/mother_1_fm6osm.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613512/mother_2_tturbg.png"
  ],
  "Lawyer" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613510/lawyer_4_lnkjga.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613511/lawyer_1_drmn5y.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613510/lawyer_3_iiznth.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613510/lawyer_2_rwlsi2.png"
  ],
  "Fireman" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613508/fireman_2_gfagoz.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613507/fireman_1_s9qbhw.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613510/fireman_4_cmvlj7.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613509/fireman_3_ttsmbe.png"
  ],
  "Police officer" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613514/police-officer_4_sqjlau.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613498/police-officer_1_vrcnoq.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613513/police-officer_2_iakjxr.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613514/police-officer_3_pb9p7j.png"
  ],
  "Teacher" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613507/teacher_3_a0pf0a.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613507/teacher_4_cqxwku.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613507/teacher_2_pzd0tz.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613506/teacher_1_oyilib.png"
  ],
  "Artist" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613504/artist_3_btzawm.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613504/artist_2_kve3jg.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613505/artist_4_ysthmw.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613504/artist_1_vomnrx.png"
  ],
  "Father" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613503/father_2_oyl9so.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613503/father_3_nldna2.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613503/father_4_fvc8lg.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613502/father_1_vv8fk4.png"
  ],
  "Surgeon" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613501/surgeon_4_xurqpr.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613501/surgeon_3_gm002l.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613500/surgeon_2_i45oxq.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613500/surgeon_1_cavjwm.png"
  ],
  "Prime minister" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613500/prime-minister_2_lhz3jc.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613499/prime-minister_1_k5ua57.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613500/prime-minister_4_w5g2o7.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613500/prime-minister_3_xlf7mi.png"
  ],
  "Dog walker" => [
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613499/dog-walker_1_uimnt2.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613498/dog-walker_2_szlklf.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613499/dog-walker_4_kkzxne.png",
    "https://res.cloudinary.com/dlhkg1lt6/image/upload/v1751613499/dog-walker_3_uywur7.png"
  ],
}

def link_images(job_title, data)
  model = Life.find_by(title: job_title)

  urls = data[job_title]

  urls.each_with_index do |url, index|
    file = URI.open(url)
    model.images.attach(io: file, filename: "#{job_title.downcase}_#{index}.jpg", content_type: "image/png")
  end
end

job_titles.each do |job_title|
  link_images(job_title, data)
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
