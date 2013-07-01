# An item is a thing for sale on FlasthThrift.

class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price_cents, :price, :images, :images_attributes, :status
  belongs_to :user
  has_many :images
  validates :status, :inclusion => { :in => [ 'listed', 'sold', 'suspended' ]}
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :images, :allow_destroy => true

  # Use the money-rails module to make a price attribute
  monetize :price_cents

  validates :user_id, :presence => true
  validates :price_cents, :presence => true
  validates :name, :presence => true
end
