class Function < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :description, :name

  has_many :users
end
