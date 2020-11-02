class DevelopmentPlansController < ApplicationController
	before_action :find_depvelopment_plan, only: [:show, :edit, :update, :destroy]
	before_action :development_plan_authorize, except: [:index]

	def new
		@development_plan = DevelopmentPlan.new
		@department = Department.find(params[:department_id]) if params[:department_id]
	end

	def show; end

	def create
		@development_plan = DevelopmentPlan.new(development_plan_params)
		if @development_plan.save
			redirect_to department_path(@development_plan.department)
		else
			render "new"
		end
	end

	def edit; end

	def update
		@development_plan.update_attributes(development_plan_params)
			redirect_to department_development_plan_path
	end

	def destroy
		@development_plan.destroy
			redirect_to department_path(department), :notice => "Development plan deleted"
	end

	private

	def development_plan_params
		params.require(:development_plan).permit(:title, :department_id)		
	end

	def department
		@department = Department.find(params[:department_id])
	end

	def find_depvelopment_plan
		@development_plan = DevelopmentPlan.find(params[:id])
	end

	def development_plan_authorize
		authorize @development_plan || DevelopmentPlan.new
	end
end
