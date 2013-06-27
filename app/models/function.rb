# -*- encoding : utf-8 -*-
class Function < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :description, :name

  has_many :users
  has_many :permissions
end
