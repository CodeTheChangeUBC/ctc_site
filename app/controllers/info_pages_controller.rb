class InfoPagesController < ApplicationController
	before_action :admin, only: [:admin_panel]

  def index
  end

  def about
  end

  def admin_panel
  	@members = Member.where(admin: false)
  	@projects = Project.all
  end

  def subscribe
  end

  private 
end
