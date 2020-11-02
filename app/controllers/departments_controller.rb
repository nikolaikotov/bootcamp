class	 DepartmentsController < ApplicationController
	# before_action :authorize_record, except: [:index, ]
	before_action :find_department, only: [:show, :edit, :update, :destroy]
	before_action :department_authorize, except: [:index]

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

	def export_as_pdf
		ExportMailer.send_department_data_as_pdf(params[:email], Department.find(params[:department_id])).deliver_now

		redirect_to department_path(params[:department_id])
	end

	private

	def department_params
		params.require(:department).permit(:title, :cover_image)
	end

	def find_department 
		@department = Department.find(params[:id])
	end

	def department_authorize
		authorize @department || Department.new
	end
end
