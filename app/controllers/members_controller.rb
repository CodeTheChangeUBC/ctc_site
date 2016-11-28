class MembersController < ApplicationController
  before_action :logged_in_member,          only: [:edit, :update]
  before_action :correct_member_or_admin,   only: [:edit, :update]
  before_action :admin,                     only: [:new]
  
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_url
      flash[:success] = "Account Created!"
    else
      render :new
    end
  end

  def index
      @execs = Member.where(exec: true, admin: false)
      @members = Member.where(exec: false, admin: false)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update 
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = "Profile Updated!"
      redirect_to edit_member_path(@member)
    else
      render 'edit'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted"
    redirect_back_or members_url
  end


  def delete
  end

  # Custom Actions 

  def make_exec 
    @member = Member.find(params[:member_id])
    if @member.make_exec
      flash[:success] = "#{@member.firstName} is now a club executive."
    else
      flash[:warning] = "Sorry, something went wrong."
    end
    redirect_back_or members_url
  end

  def unmake_exec
    @member = Member.find(params[:member_id])
    if @member.unmake_exec
      flash[:info] = "#{@member.firstName} is no longer an executive."
    else
      flash[:warning] = "Sorry, something went wrong."
    end
    redirect_back_or members_url
  end


  private

      def member_params
          params.require(:member).permit(:firstName, :lastName, :studentNumber, 
                                          :email, :password, :password_confirmation, 
                                          :avatar, :about, :url1, :url2)
      end

end