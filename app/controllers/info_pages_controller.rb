class InfoPagesController < ApplicationController
	before_action :admin, only: [:admin_panel]

  def index
  end

  def about
  end

  def admin_panel
  	@members = Member.where(admin: false).order(:created_at)
  	@projects = Project.all.order(:created_at)
  end

  def letsencrypt_root
      render text: params[:id]+".rxjz4-RTEq-DICUVh94-4TxE7VZ--PIPRN8tMB2OkVI"
  end
end


