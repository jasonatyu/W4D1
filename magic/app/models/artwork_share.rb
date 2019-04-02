# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true 
  validates :artwork_id, uniqueness: {
    scope: :viewer_id, message: "User cannot have a single piece of art shared with them more than once." }
  
  belongs_to :viewer,
  primary_key: :id, 
  foreign_key: :viewer_id, 
  class_name: :User 

  belongs_to :artwork, 
  primary_key: :id, 
  foreign_key: :artwork_id, 
  class_name: :Artwork
  
end
