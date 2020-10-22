class	 DepartmentsController < ApplicationController

		before_action :authorize_record, except: [:index, ]

	def index
		@departments = Department.all		
	end

	def new
		@department = Department.new
	end
 

 #todo


	def update
		@department = Department.find(params[:id])
		#todo
	end

	def destroy
		department = Department.find(params[:id])
		department.destroy
		redirect_to user_path :notice => "Department deleted"
	end
	
	private

	def authorize_record
		@department = Department.find(params[:id])
		authorize @department || Department.new
	end