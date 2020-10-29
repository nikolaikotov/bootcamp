class Task < ApplicationRecord

	include SharedScope
	
	belongs_to :flow_step
	has_many :task_managements 
	has_many :users, through: :task_managements 
	has_rich_text :description
	
  enum level: {
    trainee: 0,
 	  junior: 1,
 	  middle: 2,
 	  senior: 3,
  }

end
