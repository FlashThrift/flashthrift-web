=begin
  A Role is a way to distinguish between lowly pathetic users (who can only post items),
  moderators (who can remove items and suspend user accounts), sales team (who are moderators
  who can also view transactions) and the admin group, who pretty much run this town.
=end
class Role < ActiveRecord::Base
  attr_readonly :name, :role_description
end
