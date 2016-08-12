class MemberController < ApplicationController
  def new
  end

  def create
      @member = Member.new(member_params)
      @member.save
      redirect_to @member
  end

  def show
      #render plain: params[:member].inspect
      @member = Member.find(params[:id])
  end

  def index
      @members = Member.all
  end

  def edit
  end

  def delete
  end
end

private
    def member_params
        params.require(:member).permit(:firstName, :lastName, :studentNumber)
    end
