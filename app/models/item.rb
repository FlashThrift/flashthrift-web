class Item < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :user

  validates :user_id, :presence => true
end
