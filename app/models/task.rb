class Task < ApplicationRecord

	include SharedScope
	
	belongs_to :flow_step

end
