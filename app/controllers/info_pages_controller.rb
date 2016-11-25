class InfoPagesController < ApplicationController
  def index
  	@members = Member.all
  	@projects = Project.all
  end

  def about
  end

  def subscribe
  end

  def letsencrypt_root
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
  def letsencrypt_www
      render text: "Os0IHI9Z-cecVWDlYh2V_zOOY-r8FFXn6lSnB5Cd0I0.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
end


http://www.codethechangeubc.org/.well-known/acme-challenge/Os0IHI9Z-cecVWDlYh2V_zOOY-r8FFXn6lSnB5Cd0I0 before continuing:

Os0IHI9Z-cecVWDlYh2V_zOOY-r8FFXn6lSnB5Cd0I0.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c
