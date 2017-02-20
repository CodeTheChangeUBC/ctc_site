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

  def letsencrypt_root
      render text: "MQHvIkRQk-lJUM5BSmmN-89w5VwX5eYLr4yZgWpZqrg.UyFZg_rvPfJskXKL7AUxayXN4ToZ4wk8HzwvkEg6L8A"
  end

  def testing
      render text: "It works! Hello world?"
  end
  
end

