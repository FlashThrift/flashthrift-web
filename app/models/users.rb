class Users < ActiveRecord::Base
  attr_accessible :password_hash, :password_salt
end
