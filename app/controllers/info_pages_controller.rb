class InfoPagesController < ApplicationController
	before_action :admin, only: [:admin_panel]

  def index
      @subscriber = Subscriber.new
  end

  def about
  end

  def admin_panel
  	@members = Member.where(admin: false).order(:created_at)
  	@projects = Project.all.order(:created_at)
  end

  def subscribe
      puts @subscriber
      flash[:notice] = "Thanks for subscribing!"
      redirect_to root_path
  end

  private 

  def letsencrypt
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end

  def letsencrypt_root
      render text: "y1mqN6xANw3wHy3gxpmhvT0jb80F1DG1QkUYeE3JnpQ.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
end


