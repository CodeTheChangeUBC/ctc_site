class SessionsController < ApplicationController
  def new
  end

  def admin_new
  end

  def create
  	member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      params[:session][:remember_me] == '1' ? remember(member) : forget(member)
      if member.admin? 
        redirect_back_or admin_panel_url
      else
        redirect_back_or edit_member_path(member)
      end
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'admin_new'
    end
  end

  # Create with API
  def create_with_api
    auth = request.env["omniauth.auth"]     
    puts auth
    require 'net/http'
    url = URI.parse('https://api.github.com/orgs/codethechangeubc/members')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)
    response.inspect
    if (member = Member.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Member.create_with_omniauth(auth))      
      session[:member_id] = member.id
      remember(member)     
      redirect_back_or edit_member_path(member)
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
