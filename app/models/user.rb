class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # enum level: %i[trainee junior middle senior]
         #enum level: [:trainee, :junior, :middle, :senior]
        
  include SharedScope
  include DeviseInvitable::Inviter
  attr_accessor :current_password
  belongs_to :department, optional: true
  has_many :task_managements
  has_many :tasks, through: :task_managements 
  # after_initialize :set_default_role, :if => :new_record?
  has_one_attached :avatar



    enum level: {
      trainee: 0,
   	  junior: 1,
   	  middle: 2,
   	  senior: 3,
       }
    enum role: {
       	member: 0,
       	admin: 1,
       }
      

       # def set_default_role
       # 	self.role ||= :user
       # end

       def avatar_thumbnail
        if avatar.attached?
        avatar.variant(resize: '150x150!').processed 
        else
          "/default_profile.jpg"
        end
       end

       private
       def add_default_avatar
        unless avatar.attached?
          avatar.attach(
            io: File.open(
              Rails.root.join(
                'app','assets', 'images', 'default_profile.jpg'
                )
              ), filename: 'default_profile.jpg',
              content_type: 'image/jpg'
            )
          end
        end

       #user.avatar.attach(io: File.open("/path/to/face.jpg"), filename: "face.jpg", content_type: "image/jpg")


     
end
