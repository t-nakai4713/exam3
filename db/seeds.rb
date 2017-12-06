# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  title = Faker::Pokemon.location
  content = Faker::Pokemon.name

  User.create!(email: email,
               password: password,
               password_confirmation: password,
	       name: name,
	       uid: n+1
               )

  Topic.create(
    title: title,
    content: content,
    user_id: n+1
  )
end
