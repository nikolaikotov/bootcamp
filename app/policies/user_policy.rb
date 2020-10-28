class	UserPolicy < ApplicationPolicy
	attr_reader :current_user, :model	

	def index?
		@current_user.admin?
	end

	def show?
		@current_user.admin? || @current_user == @model
	end

	def update?
		@current_user.admin?
	end

	def new?
		@current_user.admin?
	end

	def destroy?
		@current_user.admin?
	end
end