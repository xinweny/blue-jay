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

test_user = User.create!(email: "test@gmail.com", password: "123456", first_name: "Taro", last_name: "Yamada", age: 35, gender: "male")

5.times do
  gender = ['male', 'female']
  name = Faker::Name.name.split(' ')
  first_name = name[0]
  last_name = name[1]
  card_picture = url(https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/breakfast.jpg)"
  User.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, age: rand(15..70), gender: gender.sample, password: "123456")
end

User.all.each do |user|
  rand(1..2).times do
    band = Band.new(name: Faker::Music.band, description: Faker::Lorem.paragraph, price: rand(100..300))
    user.bands << band
    user.save!
    band.save!
  end
end
