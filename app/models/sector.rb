class Sector < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :description, :name

  has_many :users
  has_many :places
  has_many :object_resources
end
