class TaskManagementsController < ApplicationController
	def create
		@task_management = TaskManagement.new(task_management_params)
		@task_management.save 
			redirect_to flow_step_task_path(task.flow_step, task)
	end

	def update
		task_management.done! if task_management.in_progres?
		task_management.in_progres! if task_management.pending?
			redirect_to flow_step_task_path(task.flow_step, task)
	end

	private

		def task_management
			@task_management = TaskManagement.find(params[:id])
		end

		def task_management_params
			params.permit(:task_id, :user_id)
		end

		def task
			@task = Task.find(params[:task_id])
		end
end