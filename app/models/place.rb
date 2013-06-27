# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates_presence_of :sector_id
  validates_presence_of :room_type_id
  validates_presence_of :code
  validates_presence_of :name

  attr_accessible :capacity, :code, :description, :length, :name, :width, :sector_id,
                  :room_type_id, :service_ids

  belongs_to :sector
  belongs_to :room_type
  has_many :reservations
  has_many :object_resources
  has_and_belongs_to_many :services
end
