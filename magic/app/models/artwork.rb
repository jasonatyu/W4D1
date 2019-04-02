# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { 
    scope: :artist_id, message: "artist can only have unique titles for their work" }
  
  belongs_to :artist, 
  primary_key: :id, 
  foreign_key: :artist_id, 
  class_name: :User

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  
end
