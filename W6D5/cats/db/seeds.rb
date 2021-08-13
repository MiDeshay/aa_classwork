# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all
cat1 = Cat.create(name: 'Mynx', birth_date: '2010/01/12', color: "Red", sex: "F", description: "Likes cuddles")
cat1 = Cat.create(name: 'Lynn', birth_date: '2012/08/12', color: "Blue", sex: "M", description: "Likes cuddles")
cat1 = Cat.create(name: 'Princess', birth_date: '2010/05/12', color: "Violet", sex: "F", description: "Likes cuddles")