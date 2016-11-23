class InfoPagesController < ApplicationController
  def index
  	@members = Member.all
  	@projects = Project.all
  end

  def about
  end

  def subscribe
  end

  def lesencrypt
      render text: "F1grBE1NDZgouNGkuM-pqMsWTAr1kxLpSkIebdZ4hRs.90OfpW_KIW2iDH7PtIYfiH7-LrriBcwfdEBteAfLR7c"
  end
end
