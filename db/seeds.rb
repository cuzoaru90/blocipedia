# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end


 user = User.last
 user.skip_reconfirmation!

 user.update_attributes!(
   email: 'cuzoaru90@gmail.com',
   password: 'helloworld'
 )

 users = User.all

 20.times do
   wiki = Wiki.create!(
     title: Faker::Lorem.word,
     body:  Faker::Lorem.paragraph,
     user: users.sample
   )
 end