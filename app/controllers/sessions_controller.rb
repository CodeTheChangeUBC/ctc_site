class SessionsController < ApplicationController
  def new
  end

  def create
  	member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      params[:session][:remember_me] == '1' ? remember(member) : forget(member)
      redirect_back_or member
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  # Create with API
  def create_with_api
    auth = request.env["omniauth.auth"]     
    if (member = Member.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Member.create_with_omniauth(auth))      
      session[:member_id] = member.id
      remember(member)     
      redirect_back_or member
      flash[:info] = "Hi there - sign in successful!"
    else
      flash.now[:danger] = "Sorry, something went wrong."
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
