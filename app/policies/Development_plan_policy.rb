class DevelopmentPlan < ApplicationPolicy
attr_reader :current_user, :model	

	def index?
		
	end

	def new?
		@current_user.admin?
	end

	def show?
		
	end

	def update?
		
	end

	def destroy?
		
	end


end	