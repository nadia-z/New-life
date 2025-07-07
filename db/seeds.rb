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

  descriptions = {
  "Mother" => {
    short: "A warm experience in a cozy, family-focused environment.",
    long: "Step into the heart of a loving home where you’ll learn patience, multitasking, and the art of unconditional care. From morning routines to bedtime stories, this life immerses you in the joys and challenges of parenthood."
  },
  "Lawyer" => {
    short: "A high-pressure life filled with courtroom drama and legal strategy.",
    long: "Navigate intense negotiations, write ironclad contracts, and argue passionately in court. This life is for those seeking intellectual rigor, ethical dilemmas, and the power of persuasion."
  },
  "Fireman" => {
    short: "Adrenaline-filled days saving lives and battling flames.",
    long: "Live the heroic life of a firefighter—respond to emergencies, rescue those in danger, and master the strength and discipline required for this noble profession. Every day is unpredictable and deeply meaningful."
  },
  "Police officer" => {
    short: "Protect and serve in a community-focused, fast-paced role.",
    long: "Experience the structure, responsibility, and split-second decision-making of a police officer. Uphold the law, de-escalate tense situations, and forge bonds with the community you serve."
  },
  "Teacher" => {
    short: "Inspire young minds and shape the future of tomorrow.",
    long: "Become a guiding light in the classroom—plan lessons, manage diverse learners, and foster creativity. Teaching is both an art and a science, filled with moments of challenge and deep fulfillment."
  },
  "Artist" => {
    short: "Express emotion and creativity through visual storytelling.",
    long: "Immerse yourself in a life of color, imagination, and free expression. Whether painting murals or curating exhibitions, you’ll explore the process of turning ideas into inspiring works of art."
  },
  "Father" => {
    short: "Lead, support, and grow in the role of a modern dad.",
    long: "Discover the rewarding routines of fatherhood—mentorship, playtime, and late-night diaper runs. This life offers a balanced blend of responsibility, humor, and unconditional love."
  },
  "Surgeon" => {
    short: "Precision, pressure, and purpose in the operating room.",
    long: "Master complex procedures, make split-second decisions, and save lives daily. This life immerses you in the intense, detail-oriented world of surgery, where every second matters."
  },
  "Prime minister" => {
    short: "Lead a nation with vision, diplomacy, and decisive action.",
    long: "Experience the weight and privilege of political leadership. Navigate parliament, address national crises, and strive for progress while balancing diplomacy and public service."
  },
  "Dog walker" => {
    short: "Spend your days outdoors with furry companions.",
    long: "Walk a variety of lovable pups through city parks and leafy neighborhoods. This life is perfect for animal lovers who enjoy fresh air, flexible schedules, and wagging tails."
  }
}

features = {
  "Mother" => ["Homemade meals", "Bedtime storytelling", "Laundry tutorials", "School drop-offs", "Grocery runs"],
  "Lawyer" => ["Mock court session", "Case file reviews", "Legal writing crash course", "Office attire provided", "Espresso on tap"],
  "Fireman" => ["Hose training", "Firetruck ride-along", "Rescue drill", "Uniform fitting", "Firehouse meal"],
  "Police officer" => ["Patrol simulation", "Community policing", "Crisis roleplay", "Siren driving experience", "Walkie-talkie etiquette"],
  "Teacher" => ["Lesson planning", "Grading papers", "Parent-teacher meeting roleplay", "Classroom management", "Whiteboard access"],
  "Artist" => ["Studio access", "Painting session", "Gallery walk", "Sketchbook provided", "Creative feedback loop"],
  "Father" => ["School run simulation", "Saturday breakfast", "Park playtime", "Life advice hour", "DIY projects"],
  "Surgeon" => ["Scrub-in experience", "Surgical simulation", "Medical lingo training", "Anatomy crash course", "Shift meal break"],
  "Prime minister" => ["Policy debate", "Press conference roleplay", "Cabinet briefing", "Historic speech study", "Power lunch"],
  "Dog walker" => ["Morning dog walk", "Treat pouch", "Dog park visit", "Breed education", "Puppy playtime"]
}

users.each do |user|
  User.create!(user)
end

puts "Creating lives..."
host_users = User.where(is_host: true).to_a

10.times do |count|
  price_per_day = Faker::Commerce.price(range: 50.0..500.0)

  life = Life.create!({
    title: job_titles[count],
    description_short: descriptions[job_titles[count]][:short],
    description_long: descriptions[job_titles[count]][:long],
    address: Faker::Address.full_address,
    price_per_day: price_per_day,
    features: features[job_titles[count]],
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
