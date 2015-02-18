class User < ActiveRecord::Base   ##notice the caps
    
  attr_accessor :password ##virtual attribute, without needing db column
  validates_confirmation_of :password ##virtual attribute for pw match confirmation
  before_save :encrypt_password
 
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt 
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    ##password_salt and password_hash are both columns in user, but need to 
    ##have actual password persist in memory long enough to generate hash
  end


  def self.authenticate(email,password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  has_many :subs
  has_many :posts
  has_many :comments


end
