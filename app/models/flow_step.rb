class FlowStep < ApplicationRecord

	include SharedScope

	belongs_to :development_plan
	#has_many :tasks
	
end
