class DevelopmentPlan < ApplicationRecord

	include SharedScope

	belongs_to :department
	has_many :flow_steps

end
