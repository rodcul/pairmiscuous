require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do |i|
 User.create(username: Faker::Internet.user_name,
              full_name: Faker::Name.name,
              slack_username: Faker::Internet.user_name,
              profile_picture: Faker::Avatar.image)
end
