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
  user1 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: 2,
    email: Faker::Internet.email,
    password: 'testing123',
    phone: Faker::PhoneNumber.cell_phone
  )
  puts user1
  patient1 = Patient.create(
    user_id: user1.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts patient1
  user2 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: 2,
    email: Faker::Internet.email,
    password: 'testing123',
    phone: Faker::PhoneNumber.cell_phone
  )
  puts user2
  patient2 = Patient.create(
    user_id: user2.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts patient2
  user3 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: 1,
    email: Faker::Internet.email,
    password: 'testing123',
    phone: Faker::PhoneNumber.cell_phone
  )
  puts user3
  therapist = Therapist.create(
    user_id: user3.id,
    about_me: Faker::Lorem.paragraph(5),
    hourly_rate: 10000,
    profile_image: ''
  )
  puts therapist
  connection1 = PatientTherapist.create(
    patient_id: patient1.id,
    therapist_id: therapist.id
  )
  puts connection1
  connection2 = PatientTherapist.create(
    patient_id: patient2.id,
    therapist_id: therapist.id
  )
  puts connection2



  (0..5).to_a.sample(2).each do |id|
    TherapistSpecialty.create(
      therapist_id: therapist.id,
      specialty_id: id
    )
  end

end