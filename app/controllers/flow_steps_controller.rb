class FlowStepsController < ApplicationController
	before_action :find_flow_step, only: [:show, :edit, :update, :destroy]
	helper_method :development_plan, :department

	def index
		@flow_steps = FlowStep.all
	end

	def new
		@flow_step = FlowStep.new
	end

	def show
		#@flow_step = FlowStep.find(params[:id])
	end


	def create
		@flow_step = FlowStep.new(flow_step_params)
		if @flow_step.save
		 redirect_to department_development_plan_path(department, development_plan)
		else
			render "new"
		end
	end

	def update
		@flow_step.update_attributes(flow_step_params)
		redirect_to department_development_plan_path(department, development_plan)
	end

	def destroy
		@flow_step.destroy
		redirect_to department_development_plan_path(department, development_plan), :notice => "Development plan deleted"
	end

	private

	def development_plan
		@development_plan = DevelopmentPlan.find(params[:development_plan_id])		
	end

	def department
		@department = development_plan.department
	end

	def flow_step_params
		params.require(:flow_step).permit(:title, :development_plan_id)		
	end

	def find_flow_step
		@flow_step = FlowStep.find(params[:id])
	end
end	