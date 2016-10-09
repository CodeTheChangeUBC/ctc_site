class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private 

  	# Before filters for access control

  	# Confirms a logged-in user.
    def logged_in_member
      unless logged_in?
      	store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless @member == current_member
    end
end
