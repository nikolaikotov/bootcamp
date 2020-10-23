class TasksController < ApplicationController


	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def show
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update_attributes task_params
	end

	def destroy
		task = Task.find(params[:id])
		task.destroy
		redirect_to user_path :notice => "Task deleted"
	end

	def task_params
		params.require(:task).permit(:title)
	end

end
