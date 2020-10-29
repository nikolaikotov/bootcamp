class UsersController < ApplicationController
	
	before_action :authenticate_user!
	after_action :verify_authorized
	
	def index
		@users = User.all		
		authorize @users
	end

	def new
		@user = User.new
		authorize @user
	end

	def show
		@user = User.find(params[:id])
		authorize @user
	end

	def destroy
		user = User.find(params[:id])
		authorize User
		user.destroy
		redirect_to users_path, :notice => "User deleted"
	end

	def update 
		@user = User.find(params[:id])
		authorize @user

		if @user.role == 'admin' 
			@user.update_attributes(user_params)
		elsif @user.update_attributes(secure_params)
			redirect_to users_path, :success => 'User updated'
		else	
			redirect_to users_path, :alert => 'Unable to update user'
		end
	end

	private 

	def user_params
		params.require(:user).permit(:first_name, :last_name, :avatar, :email, :password, :current_password)
	end

		def secure_params
			params.require(:user).permit(:role, :level)			
		end
end
