module SharedScope
	extend ActiveSupport::Concern

	included do 
		scope :today, -> {where(created_at: (DataTime.current.beginning_of_day..DateTime.now))} #Не весь код
	end
end