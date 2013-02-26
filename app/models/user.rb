class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :uid, :provider
  # attr_accessible :title, :body
  #validates_presence_of :user_id, :uid, :provider
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.auth_find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end
  
  def self.auth_create_from_hash(hash, user = nil)
    user ||= User.create_from_hash!(hash)
    name = hash['extra']['raw_info']['name']
    name = "#{hash['extra']['raw_info']['first_name']} #{hash['extra']['raw_info']['last_name']}" if name.nil? 
    User.create(:name => name, :uid => hash['uid'], :provider => hash['provider'])
  end  
  
  def self.create_from_hash!(hash)
    name = hash['extra']['raw_info']['name']
    name = "#{hash['extra']['raw_info']['first_name']} #{hash['extra']['raw_info']['last_name']}" if name.nil? 
    User.create(:name => name)
  end
end
