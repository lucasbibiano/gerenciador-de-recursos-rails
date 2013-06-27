# -*- encoding : utf-8 -*-
class ObjectResource < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :sector_id
  validates_presence_of :tombamento
  validates_presence_of :name
  
  attr_accessible :description, :name, :tombamento, :sector_id, :place_id, :category_list

  acts_as_taggable_on :categories

  belongs_to :sector
  belongs_to :place
  has_and_belongs_to_many :reservations
end
