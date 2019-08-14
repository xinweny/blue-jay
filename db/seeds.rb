# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  gender = ['male', 'female']
  name = Faker::Name.name.split(' ')
  first_name = name[0]
  last_name = name[1]
  User.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, age: rand(15..70), gender: gender.sample, password: "123456")
end

Users.each do {
    2.times do
      name = Faker::Name.name
      price = Faker::Number.digit
      description = Faker::Name.name
      Band.create!(name: name, price: price, description: description)
  end
}
end
