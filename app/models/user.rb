# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :cpf, :name

  belongs_to :function
  belongs_to :sector

  has_many :reservations
end
