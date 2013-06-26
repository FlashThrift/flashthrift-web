class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price_cents, :price
  belongs_to :user

  # Use the money-rails module to make a price attribute
  monetize :price_cents

  validates :user_id, :presence => true
  validates :price_cents, :presence => true
  validates :name, :presence => true
end
