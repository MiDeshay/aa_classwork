# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all
User.destroy_all

Bench.create(description: "Confluence Park Bench", lat: 47.537114, lng: -122.038652)
Bench.create(description: "Municipal Court Bench", lat: 47.529727, lng: -122.034250)
Bench.create(description: "Issaquah Library Bench", lat: 47.530318, lng: -122.036695)
Bench.create(description: "Issaquah Police and City Hall Bench", lat: 47.530477, lng: -122.034139)

User.create(username: "Emilia", email:"The gentle", password: "secure")
User.create(username: "Robert", email:"The fast", password: "password")
User.create(username: "Tyson", email:"The Bold", password: "webpack")
User.create(username: "Jason", email:"The wise", password: "hero")