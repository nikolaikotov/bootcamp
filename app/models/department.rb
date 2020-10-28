class Department < ApplicationRecord
	
	include SharedScope


	has_many :users

	has_many :development_plans

	has_one_attached :cover_image

	def cover_image_thumbnail
		if cover_image.attached?
			cover_image.variant(resize: '150x150!').processed 
		  else
		  "/default_profile.jpg"
		end
	end

	private
		def add_default_cover_image
			unless cover_image.attached?
		  	cover_image.attach(
		  		io: File.open(
		 				Rails.root.join(
		 					'app','assets', 'images', 'default_profile.jpg'
		                )
		              ), filename: 'default_profile.jpg',
		              content_type: 'image/jpg'
		            )
		end
	end

end
