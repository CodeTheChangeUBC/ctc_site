class InfoPagesController < ApplicationController
  def index
  	@members = Member.all
  	@projects = Project.all
  end

  def about
  end

  def subscribe
  end
end
