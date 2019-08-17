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
Review.destroy_all if Rails.env.development?

addresses = ['Blue Note Tokyo', 'University of Tokyo', 'Narisawa', 'Shangri-La Tokyo', 'Hilton Tokyo']
jazz_types = ['Bossa Nova', 'Smooth', 'Piano', 'Blues', 'Swing', 'Jazz Trio', 'Vocal', 'Ragtime', 'Soul', 'Latin', 'Stride' ]

booking_user = User.create!(email: "test@gmail.com", password: "123456", first_name: "Jae Lim", last_name: "Chung", age: 29, gender: "female")
band_user = User.create!(email: "band@gmail.com", password: "123456", first_name: "Rick", last_name: "Astley", age: 30, gender: "male")

other_users = []

5.times do
  gender = ['male', 'female']
  name = Faker::Name.name.split(' ')
  first_name = name[0]
  last_name = name[1]
  other_users << User.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, age: rand(15..70), gender: gender.sample, password: "123456")
end

other_users.each do |user|
  band = Band.create!(name: Faker::Music.band, jazz_type: jazz_types.sample(rand(1..3)).join(', '), description: Faker::Lorem.paragraph, price: rand(100..300), user_id: user.id, video_url: "https://www.youtube.com/dQw4w9WgXcQ")
end

rick_band = Band.create!(name: "Rick Astley", jazz_type: "Bossa Nova, Smooth", description: "Richard Paul Astley (born 6 February 1966) is an English singer, songwriter and radio personality. His 1987 song \"Never Gonna Give You Up\" was a number 1 hit single in 25 countries and won the 1988 Brit Award for Best British Single.[1][2] By the time of his retirement in 1993, Astley had sold approximately 40 million records worldwide.[3][4][5]

Astley made a comeback in 2007, becoming an Internet phenomenon when the music video for \"Never Gonna Give You Up\" became integral to the meme known as \"rickrolling\".[6] Astley was voted \"Best Act Ever\" by Internet users at the MTV Europe Music Awards 2008,[7] and his 2016 album 50 debuted in the UK at No. 1.[8]", price: rand(100..300), user_id: band_user.id, video_url: "https://www.youtube.com/dQw4w9WgXcQ")

Review.create!(rating: 5, content: 'Never gonna give you up', user: other_users.sample, band: rick_band)
Review.create!(rating: 5, content: 'Never gonna let you down', user: other_users.sample, band: rick_band)
