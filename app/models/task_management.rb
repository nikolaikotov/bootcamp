class TaskManagement < ApplicationRecord
	belongs_to :user
	belongs_to :task

	enum state: {
		pending: 0,
		in_progres: 1,
		done: 2,
	} 
	
	scope :by_user, -> (user_id) {where(user_id: user_id)}

end
