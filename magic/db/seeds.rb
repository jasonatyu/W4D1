# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

artists = []
10.times do
  random_name = Faker::Artist.name
  artists << random_name if !artists.include?(random_name)
end

artists.each do |artist|
  User.create!("username" => artist)
end

Artwork.create!({"title" => Faker::Ancient.hero, "image_url" => "www.google.com", "artist_id" => User.first.id })
Artwork.create!({"title" => Faker::Ancient.hero, "image_url" => "www.facebook.com", "artist_id" => User.second.id })
Artwork.create!({"title" => Faker::Ancient.hero, "image_url" => "www.twitter.com", "artist_id" => User.third.id })

ids = User.ids

ArtworkShare.create!({"artwork_id" => Artwork.first.id , "viewer_id" => ids[-1]})
ArtworkShare.create!({"artwork_id" => Artwork.second.id , "viewer_id" => ids[-2]})
ArtworkShare.create!({"artwork_id" => Artwork.third.id , "viewer_id" => ids[-3]})
ArtworkShare.create!({"artwork_id" => Artwork.third.id , "viewer_id" => ids[-5]})



