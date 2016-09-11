class MembersController < ApplicationController
  
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
      flash[:success] = "Account Created!"
    else
      render :new
    end
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

  private

      def member_params
          params.require(:member).permit(:firstName, :lastName, :studentNumber, 
                                          :email, :password, :password_confirmation)
      end
end