=begin
  A Role is a way to distinguish between lowly pathetic users (who can only post items),
  moderators (who can remove items and suspend user accounts), sales team (who are moderators
  who can also view transactions) and the admin group, who pretty much run this town.
=end
class Role < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users
end
