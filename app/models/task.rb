class Task < ApplicationRecord

	include SharedScope
	
	belongs_to :development_plan

end
