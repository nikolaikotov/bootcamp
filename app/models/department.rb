class Department < ApplicationRecord
	
	include SharedScope


	has_many :users

	has_many :development_plans

	 #has_one_attached :avatar

       #user.avatar.attach(io: File.open("/path/to/face.jpg"), filename: "face.jpg", content_type: "image/jpg")


end
