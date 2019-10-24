# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableSpecialtyDoctor.destroy_all
City.destroy_all

specialty_1 = Specialty.create(name: "generaliste")
specialty_2 = Specialty.create(name: "urologue")
specialty_3 = Specialty.create(name: "kinesitherapeute")
specialty_4 = Specialty.create(name: "Gynecolegue")
specialty_5 = Specialty.create(name: "chirurgien")

puts "OK"

city_1 = City.create(name: 'Bordeaux :)')
city_2 = City.create(name: 'Lyon')
city_3 = City.create(name: 'Paris')
city_4 = City.create(name: 'Limoges')
puts "OK"

 # sample = les éléments sont choisis en utilisant des index aléatoires et uniques
15.times do
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: rand(10000..80000)) 
  doctor.city = [city_1, city_2, city_3, city_4].sample # ajute city a doctor
  doctor.save
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) 
  patient.city = [city_1, city_2, city_3, city_4].sample # ajute city a patient
  patient.save
  appointment = Appointment.create(doctor: doctor, patient: patient) 
  appointment.city = [city_1, city_2, city_3, city_4].sample #add city to appointment
  appointment.save
  # ajute specialty pour chaque doctor
  join_table_specialty_doctor =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty_1, specialty_2, specialty_3, specialty_4, specialty_5].sample)
end
puts "OK"



