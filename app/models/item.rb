class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price_cents, :price, :images, :images_attributes
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true

  # Use the money-rails module to make a price attribute
  monetize :price_cents

  validates :user_id, :presence => true
  validates :price_cents, :presence => true
  validates :name, :presence => true
end
