class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :name, :email, :administrator, :password, :password_confirmation

  #has_many :parties
  has_many :cohost_invitations, :dependent => :destroy
  has_many :parties, :source => :host_id, :dependent => :destroy
  has_many :guest_invitations, :foreign_key => "invited_by",  :dependent => :destroy
  has_many :guests, :foreign_key => "host_id", :dependent => :destroy
  has_many :locations, :foreign_key => "host_id", :dependent => :destroy

  attr_accessor :password
  before_save :prepare_password
  
  scope :all, :order => "name"
  
  validates_uniqueness_of :email
  #validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_email(login)
    return user if user && user.matching_password?(pass)
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end
end
