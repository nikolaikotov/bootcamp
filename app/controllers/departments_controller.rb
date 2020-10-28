class	 DepartmentsController < ApplicationController

	# before_action :authorize_record, except: [:index, ]
	before_action :find_department, only: [:show, :edit, :update, :destroy]
	def index
		@departments = Department.all		
	end

	def new
		@department = Department.new
	end
 
	def show
		@department = Department.find(params[:id])
	end

	def create
		@department = Department.new(department_params)
		if @department.save
		 redirect_to departments_path
		else
			render "new"
		end
	end

	def edit
		
	end

	def update
		#@department = Department.find(params[:id])
		if @department.update_attributes(department_params)
			 redirect_to department_path
		else
			 render "edit"
		end
	end

	def destroy
		department = Department.find(params[:id])
		department.destroy
		redirect_to departments_path :notice => "Department deleted"
	end

	private

	# def authorize_record
	# 	@department = Department.find(params[:id])
	# 	authorize @department || Department.new
	# end

	def department_params
		params.require(:department).permit(:title, :cover_image)
	end

	def find_department 
		@department = Department.find(params[:id])
	end
end
	

