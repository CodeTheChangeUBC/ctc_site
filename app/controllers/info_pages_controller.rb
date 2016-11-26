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

  def letsencrypt
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end

  def letsencrypt_root
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
  
  def letsencrypt_www
      render text: "ASqS42vVN3r0rY2zUEp-kk3uAMo3HCV2zJkXr8Ybvzo.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end

end
