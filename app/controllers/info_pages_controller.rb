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
      existing_sub = Subscriber.where(email: params[:subscriber][:email]).first
      
      if not existing_sub
          @subscriber = Subscriber.create(email: params[:subscriber][:email])

      else
          @subscriber = existing_sub
      end

      if @subscriber.valid?
          mail = SubscriberMailer.welcome_email(@subscriber)
          puts mail
          redirect_to root_url
          flash[:success] = "Thanks for subscribing!"
      else
          redirect_to root_url
          flash[:warning] = "Couldn't sign you up. Try again? If you are having troubles, send us an email at info@codethechangeubc.org"
      end
  end

  private 

  def letsencrypt
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end

  def letsencrypt_root
      render text: "y1mqN6xANw3wHy3gxpmhvT0jb80F1DG1QkUYeE3JnpQ.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
end


