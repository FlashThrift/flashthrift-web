#
# transcation.rb
# A Transaction obejct represents an item purchase
#
class Transaction < ActiveRecord::Base
  belongs_to :item
  belongs_to :user # The buyer, since the seller is already known through the item
end
