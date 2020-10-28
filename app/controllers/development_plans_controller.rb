class DevelopmentPlansController < ApplicationController
		before_action :find_depvelopment_plan, only: [:show, :edit, :update, :destroy]
	def index
		@development_plans = DevelopmentPlan.all
	end

	def new
		@development_plan = DevelopmentPlan.new
	end

	def show
		#@development_plan = DevelopmentPlan.find(params[:id])
	end


	def create
		@development_plan = DevelopmentPlan.new(development_plan_params)
		if @development_plan.save
		 redirect_to development_plans_path
		else
			render "new"
		end
	end


	def edit
		
	end

	def update
		#@development_plan = DevelopmentPlan.find(params[:id])
		@development_plan.update_attributes(development_plan_params)
		 redirect_to development_plans_path
	end

	def destroy
		#development_plan = DevelopmentPlan.find(params[:id])
		@development_plan.destroy
		redirect_to user_path :notice => "Development plan deleted"
	end

	private

	def development_plan_params
		params.require(:development_plan).permit(:title, :department_id)		
	end

	def find_depvelopment_plan
		@development_plan = DevelopmentPlan.find(params[:id])
	end
end

