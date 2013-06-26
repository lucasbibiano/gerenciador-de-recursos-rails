class Permission < ActiveRecord::Base
  attr_accessible :action, :subject_class, :subject_id

  belongs_to :function
end
