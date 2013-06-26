class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :capacity, :code, :description, :length, :name, :width

  belongs_to :sector
  belongs_to :room_type
  has_many :reservations
  has_and_belongs_to_many :services
end
