class Reservation < ActiveRecord::Base
  attr_accessible :begin, :end, :status

  belongs_to :user
  belongs_to :place
  has_and_belongs_to_many :object_resources
end