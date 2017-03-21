# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'

# User.destroy_all

# 10.times do
#   user = User.new( name:     Faker::Name.name,
#                    email:    Faker::Internet.email,
#                    password: 'helloworld' )
#   user.skip_confirmation!
#   user.save!
# end

# user = User.new( name:     'Chuck Uzoaru', 
#                  email:    'cuzoaru90@gmail.com', 
#                  password: 'helloworld' )
# user.skip_confirmation!
# user.save!

# users = User.all

# users.each do | user | 
#   user.wikis.create!( title: Faker::Lorem.word,
#                       body:  Faker::Lorem.paragraph,
#                       private: false )
# end

# wikis = Wiki.all

# count = 0

# while count < 20
#   user = users.sample
#   wiki = wikis.sample

#   if !collaboration.find_by(user_id: user.id, wiki_id: wiki.id)
#     collaboration.create(user: user, wiki: wiki)
#     count = count + 1
#   end
# end
