class TasksController < ApplicationController
	before_action :find_task, only: [:show, :edit, :update, :destroy]
	helper_method :flow_step, :development_plan

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
		 redirect_to development_plan_flow_step_path(development_plan, flow_step)
		else
			render "new"
		end
	end

	def update
		@task.update_attributes(task_params)
		redirect_to development_plan_flow_step_path(development_plan, flow_step)
	end

	def destroy
		@task.destroy
		redirect_to user_path :notice => "Task deleted"
	end

	private 

	def find_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:title, :level, :flow_step_id)
	end

	def flow_step
		@flow_step = FlowStep.find(params[:flow_step_id])
	end


	def development_plan
		@development_plan = flow_step.development_plan
	end
end
