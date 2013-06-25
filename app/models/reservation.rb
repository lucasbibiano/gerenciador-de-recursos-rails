class Reservation < ActiveRecord::Base
  attr_accessible :begin, :end, :status
end
