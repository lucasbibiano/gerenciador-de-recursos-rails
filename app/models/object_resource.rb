class ObjectResource < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :sector_id
  validates_presence_of :tombamento
  validates_presence_of :name
  
  attr_accessible :description, :name, :tombamento, :sector_id, :place_id

  belongs_to :sector
  belongs_to :place
  has_and_belongs_to_many :reservations
end
