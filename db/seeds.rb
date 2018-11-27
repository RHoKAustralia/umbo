# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




specialties = [
  { name: 'Children', category: 0},
  { name: 'Adults', category: 0},
  { name: 'Autism', category: 1},
  { name: 'Cerebral Palsy', category: 1},
  { name: 'Developmental Delays', category: 1},
  { name: 'Down Syndrome', category: 1},
  { name: 'speech', category: 2 },
  { name: 'Language & Development', category: 2},
  { name: 'Stuttering', category: 2},
  { name: 'Voice', category: 2},
  { name: 'Sensory processing', category: 3},
  { name: 'Fine Motor Skills', category: 3},
  { name: 'Feeding/Swallowing', category: 3},
  { name: 'Literacy', category: 4},
  { name: 'Behaviour Support', category: 4},
  { name: 'AAC and Multimodal Communication', category: 4},
]

specialties.each do |hash|
  Specialty.create(
    name: hash[:name],
    category: hash[:category]
  )
end

# Create users
10.times do
  patients = []
  10.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      role: 2,
      email: Faker::Internet.email,
      password: 'testing123',
      phone: Faker::PhoneNumber.cell_phone
    )
    puts user
    patient = Patient.create(
      user_id: user.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
    puts patient
    patients << patient
  end
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: 1,
    email: Faker::Internet.email,
    password: 'testing123',
    phone: Faker::PhoneNumber.cell_phone
  )
  puts user
  therapist = Therapist.create(
    user_id: user.id,
    about_me: Faker::Lorem.paragraph(5),
    hourly_rate: 10000,
    profile_image: ''
  )
  puts therapist
  patients.each do |patient|
    connection = PatientTherapist.create(
      patient_id: patient.id,
      therapist_id: therapist.id
    )
    puts connection
  end

  (1..16).to_a.sample(3).each do |id|
    TherapistSpecialty.create(
      therapist_id: therapist.id,
      specialty_id: id
    )
  end
end

# puts "generating sessions"
# # Select random user and listing
# Therapist.all.each do |therapist|
#   p therapist
#   # therapist = Therapist.find(Therapist.pluck(:id).sample)
#   date_range = (3.months.ago.to_date..3.months.from_now.to_date).to_a
#   session_times = []
#   date_range.each do |date|
#     time1 = date.to_time + 9.hours
#     times = [time1]
#     32.times do |i|
#       time1 += 15.minutes
#       times << time1
#     end
#     2.times do
#       time = times[0..-4].sample
#       index = times.index(time)
#       num_blocks = rand(1..4)
#       length = num_blocks * 15
#       time2 = time + length.minutes
#       if times.index(time2) != index + num_blocks
#         next
#       end
#       times.slice!(index, num_blocks)
#       session_times << { time: time, length: length }
#     end
#   end

#   session_times.each_with_index do |hash, i|
#     time = hash[:time]
#     length = hash[:length]
#     Session.create(
#       therapist_id: therapist.id,
#       patient_id: therapist.patients[i % 10].id,
#       date: time.to_date,
#       start_time: time.strftime("%H:%M"),
#       end_time: (time + length.minutes).strftime("%H:%M"),
#       payment_date: time - 7.days,
#       total_cost: length * 3 * 100
#     )
#   end
# end

# Set 2 easy to remember emails
User.first.update(email: "patient@email.com")
User.find(11).update(email: "therapist@email.com")

# Create admin
user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  role: 0,
  email: 'admin@email.com',
  password: 'testing123',
  phone: Faker::PhoneNumber.cell_phone
)
