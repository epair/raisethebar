# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bar.create([
  {name: 'The Mission',
    address: '20 Huntington Ave',
    city: Faker::Address.city,
    state: 'MA',
    zip: '02115',
    description: Faker::Lorem.paragraph},
  {name: Faker::Name.name,
    address: '20 Huntington Ave',
    city: Faker::Address.city,
    state: 'MA',
    zip: '02115',
    description: Faker::Lorem.paragraph}
])
