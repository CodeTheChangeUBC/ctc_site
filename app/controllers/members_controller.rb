class MembersController < ApplicationController
  before_action :logged_in_member, only: [:edit, :update]
  before_action :correct_member,   only: [:edit, :update]
  
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      log_in @member
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
    @member = Member.find(params[:id])
  end

  def update 
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = "Profile Updated!"
      redirect_to @member
    else
      render 'edit'
    end
  end


  def delete
  end

  private

      def member_params
          params.require(:member).permit(:firstName, :lastName, :studentNumber, 
                                          :email, :password, :password_confirmation)
      end
end