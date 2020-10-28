class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :avatar)}
               devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :department_id, :level, :role)}
               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :avatar)}
          end
  private

  	def user_not_authorized
  		flash[:alert] = "Access denied."
  		redirect_to (request.referrer || root_path)  		
  	end

    def authenticate_inviter!
      unless current_user.role=='admin'
        redirect_to root_url, :alert => "Access Denied"
      end
      super
    end

end
