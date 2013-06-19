class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation

  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  
  
  validates :email, :presence => true,
                    :uniqueness => true

  validates :username, :presence => true,
                       :uniqueness => true

  # Items this user has listed
  has_many :items

  # Users can have multiple roles
  has_and_belongs_to_many :roles

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Checks if a user belongs to a role
  def check_role(role_name)
    all_roles = Role.all
    r = nil
    all_roles.each do |role|
      if role.role_name == role_name
        r = role
      end
    end

    unless r.nil?
      return self.roles.include?(r)
    end
    
    return false
  end

end
