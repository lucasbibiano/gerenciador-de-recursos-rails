class ObjectResource < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :description, :name, :tombamento

  belongs_to :sector
  belongs_to :place
  has_and_belongs_to_many :reservations
end
