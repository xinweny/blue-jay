# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Band.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?

test_user = User.create!(email: "test@gmail.com", password: "123456", first_name: "Taro", last_name: "Yamada", age: 35, gender: "male")
addresses = ['Blue Note Tokyo', 'University of Tokyo', 'Narisawa', 'Shangri-La Tokyo', 'Hilton Tokyo']

5.times do
  gender = ['male', 'female']
  name = Faker::Name.name.split(' ')
  first_name = name[0]
  last_name = name[1]
  User.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, age: rand(15..70), gender: gender.sample, password: "123456")
end

User.all.each do |user|
  rand(1..2).times do
    band = Band.create!(name: Faker::Music.band, description: Faker::Lorem.paragraph, price: rand(100..300), user_id: user.id, video_url: Faker::Internet.url)
  end
end

User.all.each do |user|
  rand(1..3).times do
    band = Band.all.sample
    booking = Booking.create!(address: addresses.sample, description: Faker::Lorem.paragraph, event_start: DateTime.now, event_end: (DateTime.now.to_time + rand(1..5).hours).to_datetime, user_id: user.id, band_id: band.id)
  end
end

Band.all.each do |band|
  rand(1..3).times do
    user = User.all.sample
    booking = Booking.create!(address: addresses.sample, description: Faker::Lorem.paragraph, event_start: DateTime.now, event_end: (DateTime.now.to_time + rand(1..5).hours).to_datetime, user_id: user.id, band_id: band.id)
  end
end
