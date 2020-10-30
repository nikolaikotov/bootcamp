class	CommentsController < ApplicationController
#before_actions :authenticate_user!
before_action :set_commentable
def create
	@comment = @commentable.comments.new(comment_params)
	@comment.save
	redirect_to flow_step_task_path(@commentable.flow_step, @commentable), notice: "Your comment was succesfully posted."
end

private 
	
	def comment_params
		params.require(:comment).permit(:body, :user_id)		
	end

	def set_commentable
		@commentable = Task.find(params[:task_id])
	end


end
