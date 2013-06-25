class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price_cents
  belongs_to :user

  # Use the money-rails module to make a price attribute
  monetize :price_cents

  validates :user_id, :presence => true
end
