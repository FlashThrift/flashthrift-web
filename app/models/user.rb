class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation, :active

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

  # Authenticate a user against a password.  Returns the user object if the user is authenticated
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

  # Encrypts the password.  This is done before saving the user to the database
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def is_admin?
    self.check_role('admin')
  end

  def is_sales?
    self.check_role('sales')
  end

  def is_moderator?
    self.check_role('moderators')
  end

  # Checks if this user belongs to a role
  def check_role(role_name)
    all_roles = Role.all
    r = nil
    all_roles.each do |role|
      if role.name == role_name
        r = role
      end
    end

    unless r.nil?
      return self.roles.include?(r)
    end
    
    return false
  end

end
