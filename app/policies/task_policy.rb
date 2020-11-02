class	TaskPolicy < ApplicationPolicy

	def index?
		super
	end

	def new?
		@current_user.admin?
	end

	def show?
		true
	end

	def update?
		super
	end

	def destroy?
		@current_user.admin?
	end

end