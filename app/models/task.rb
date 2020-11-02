class Task < ApplicationRecord

	include SharedScope
	
	belongs_to :flow_step

  enum level: {
    trainee: 0,
 	  junior: 1,
 	  middle: 2,
 	  senior: 3,
  }

end
