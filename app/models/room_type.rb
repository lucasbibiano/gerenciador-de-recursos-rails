class RoomType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :description, :name

  has_many :places
end
