class DevelopmentPlansController < ApplicationController

	def index
		@development_plans = DevelopmentPlan.all
	end

	def new
		@development_plan = DevelopmentPlan.new
	end

	def show
		@development_plan = DevelopmentPlan.find(params[:id])
	end

	def update
		@development_plan = DevelopmentPlan.find(params[:id])
		@development_plan.update_attributes development_plan_params
	end

	def destroy
		development_plan = DevelopmentPlan.find(params[:id])
		development_plan.destroy
		redirect_to user_path :notice => "Development plan deleted"
	end

	def development_plan_params
		params.require(:development_plan).permit(:title)		
	end
end
