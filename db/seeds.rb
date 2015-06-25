require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cohort.create(name: '#april2015')
Cohort.create(name: '#june2015')
Cohort.create(name: '#alumni')
Cohort.create(name: '#coaches')

def assign_cohort(cohort_name, size)
  c = Cohort.find_by(name: cohort_name)
  size.times do |i|
    User.create(username: Faker::Internet.user_name,
                  full_name: Faker::Name.name,
                  slack_username: Faker::Internet.user_name,
                  profile_picture: Faker::Avatar.image,
                  cohort_id: c.id)
  end
end

assign_cohort('#april2015', 20)
assign_cohort('#june2015', 30)
assign_cohort('#alumni', 10)
assign_cohort('#coaches', 10)

def assign_pairs(cohort_name)
  cohort = Cohort.find_by(name: cohort_name)
  x = 1
  count = 1
  cohort.users.shuffle.each do |u|
    Pairing.create(pair_id: x, user_id: u.id)
    x += 1 if count.even?
    count += 1
  end

end

assign_pairs('#april2015')