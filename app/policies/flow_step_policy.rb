class FlowStepPolicy < ApplicationPolicy
attr_reader :current_user, :model	

	def index?
		super
	end

	def new?
		@current_user.admin?
	end

	def show?
		super
	end

	def update?
		super
	end

	def destroy?
		super
	end


end	