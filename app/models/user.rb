class User < ActiveRecord::Base
	
	include Amistad::FriendModel

	has_many :galleries
	has_many :pictures, :through => :galleries
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me
	# attr_accessible :title, :body
end
