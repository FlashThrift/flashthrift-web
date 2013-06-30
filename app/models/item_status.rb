# An ItemStatus specifies if the item is for sale, sold, or suspended
class ItemStatus < ActiveRecord::Base
  attr_accessible :status
  belongs_to :item
end
