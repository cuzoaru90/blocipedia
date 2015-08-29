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
     password: Faker::Lorem.characters(10),
     #role: 'standard'
   )
   user.skip_confirmation!
   user.save!
 end

 user = User.new(
     name:     'Premium User',
     email:    'premium@example.com',
     password: 'helloworld',
     #role: 'premium'
  )

  user.skip_confirmation!
  user.save!

 user = User.new(
     name:     'Admin',
     email:    'admin@example.com',
     password: 'helloworld',
     #role: 'admin'
  )
  
  user.skip_confirmation!
  user.save!


  users = User.all

 30.times do
   wiki = Wiki.create!(
     title: Faker::Lorem.word,
     body:  Faker::Lorem.paragraph,
     private: false, # public by default
     user: users.sample
   )
 end