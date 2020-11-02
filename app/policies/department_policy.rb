class	DepartmentPolicy < ApplicationPolicy 
attr_reader :current_user, :model	

	def index?
		
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
		@current_user.admin? && @model.users.empty?
	end

	def export_as_pdf?
		true
	end
end	