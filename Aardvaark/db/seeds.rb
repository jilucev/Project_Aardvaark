# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
  firstname: "James",
  lastname: "Romanchuk",
  email: "jamesbook@umblepie.com",
  phone: "778.833.3467",
  password: "meh123"
)

User.create!(
  firstname: "Jack",
  lastname: "Malone",
  email: "jmal@face.com",
  phone: "778.822.0021",
  password: "shuddap"
)

User.create!(
  firstname: "Jessica",
  lastname: "Rabbit",
  email: "jrabbit@hwood.com",
  phone: "907.998.6734",
  password: "wooga001"
)

User.create!(
  firstname: "Brock",
  lastname: "Samson",
  email: "brock@venture.com",
  phone: "Fuck off",
  password: "tammy"
)