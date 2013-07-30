class Gallery < ActiveRecord::Base
	has_many :pictures, :dependent => :destroy
	belongs_to :user
  	attr_accessible :cover, :title
  	mount_uploader :cover, ImageUploader
end
