# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email: "james@gmail.com",
  password: "james",
  firstname: "James",
  lastname: "Romanchuk",
)

User.create!(
  email: "jill@gmail.com",
  password: "jill",
  firstname: "Jill",
  lastname: "Evin",
)

User.create!(
  email: "ali@gmail.com",
  password: "ali",
  firstname: "Alisha",
  lastname: "Foreign",
)

User.create!(
  email: "dawid@gmail.com",
  password: "dawid",
  firstname: "Dawid",
  lastname: "Spammer",
)

User.create!(
  email: "mel@gmail.com",
  password: "mel",
  firstname: "Melissa",
  lastname: "Hubert",
)

User.create!(
  email: "simon@gmail.com",
  password: "simon",
  firstname: "Simon",
  lastname: "Rai",
)

Organization.create!(
  name: "Catfish",
  email: "catfish@gmail.com",
  password: "catfish"
)

Organization.create!(
  name: "Habits for Hobos",
  email: "hobo@gmail.com",
  password: "hobo"
)

Organization.create!(
  name: "Prince Albert's Home for Preteen Boys",
  email: "boys@gmail.com",
  password: "boys"
)

Organization.create!(
  name: "Sgt Pepper's Lonely Hearts Club",
  email: "pepper@gmail.com",
  password: "pepper"
)






