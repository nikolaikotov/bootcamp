class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # enum level: %i[trainee junior middle senior]
         #enum level: [:trainee, :junior, :middle, :senior]
        
   include SharedScope

       enum level: {
         	trainee: 0,
         	junior: 1,
         	middle: 2,
         	senior: 3,
       }
       enum role: {
       	user: 0,
       	admin: 1,
       }
       after_initialize :set_default_role, :if => :new_record?

       def set_default_role
       	self.role ||= :user
       end

       belongs_to :department, optional: true

     
end
