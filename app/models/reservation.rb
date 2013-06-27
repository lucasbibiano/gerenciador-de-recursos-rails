# -*- encoding : utf-8 -*-
class Reservation < ActiveRecord::Base
  attr_accessible :begin, :end, :status, :place_id, :object_resource_ids

  validates_inclusion_of :status, :in => %w(Pending Approved Rejected)

  belongs_to :user
  belongs_to :place
  has_and_belongs_to_many :object_resources

  def self.approve(reservation)
    reservation.status = "Approved"

    Reservation.all.each do |reser|
      if reservations_collide?(reservation, reser)
        return false
      end
    end

    return reservation.save
  end

  def self.reservations_collide?(reservation, reser)
    return false if reser == reservation or reser.status != "Approved"

    needs_check = false

    needs_check = true if reservation.place == reser.place and 
      not (reservation.place.nil? or reser.place.nil? ) or 
      not (reservation.object_resources & reser.object_resources).empty?
      
    return true if needs_check and
      reser.begin <= reservation.end and reservation.begin <= reser.end  

    return false 
  end

  def self.reject(reservation)
    reservation.status = "Rejected"
    return reservation.save
  end

  def self.set_pending(reservation)
    reservation.status = "Pending"
    return reservation.save
  end
end
