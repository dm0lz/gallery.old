
class Picture < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :user
	attr_accessible :comment, :name, :image
	mount_uploader :image, ImageUploader

	before_create :default_name

	def default_name
		#binding.pry
	  	nom = File.basename(image.filename, '.*').titleize if image 
	  	self.name ||= nom[0..20]
		#binding.pry
	end
end
