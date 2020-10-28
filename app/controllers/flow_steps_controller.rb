class FlowStepsController < ApplicationController
			before_action :find_flow_step, only: [:show, :edit, :update, :destroy]
	
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
		 redirect_to flow_steps_path
		else
			render "new"
		end
	end


	def edit
		
	end

	def update
		#@flow_step = FlowStep.find(params[:id])
		@flow_step.update_attributes(flow_step_params)
		 redirect_to flow_steps_path
	end

	def destroy
		#flow_step = FlowStep.find(params[:id])
		@flow_step.destroy
		redirect_to flow_steps_path :notice => "Development plan deleted"
	end

	private

	def flow_step_params
		params.require(:flow_step).permit(:title, :development_plan_id)		
	end

	def find_flow_step
		@flow_step = FlowStep.find(params[:id])
	end
end	