# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create = .new + .save comprised
User.create(username: 'Jimmy')
User.create(username: 'Sarah')
User.create(username: 'Lee')
User.create(username: 'David')

Artwork.create(title: 'Statue of Liberty', image_url: 'statue_of_liberty.png', artist_id: 1)
Artwork.create(title: 'Sunshine', image_url: 'sunshine.png', artist_id: 2)
Artwork.create(title: 'Moonshine', image_url: 'moonshine.png', artist_id: 3)
Artwork.create(title: 'hello', image_url: 'hello.png', artist_id: 4)


ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 2, viewer_id: 3)
