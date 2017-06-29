# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Emma', 'Olivia', 'Sophia', 'Ava', 'Isabella', 'Mia', 'Abigail', 'Etienne']

10.times do
  User.create(email: "#{names.sample}@gmail.com", nickname: "#{names.sample}", avatar:"https://unsplash.it/200/200/?random
", password: 123456, gender: true)
end
