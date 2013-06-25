class Place < ActiveRecord::Base
  attr_accessible :capacity, :code, :description, :length, :name, :width
end
