class BlackmailsController < ApplicationController

  before_filter :find_user_and_blackmail

  private

  def find_user_and_blackmail
    @blackmail = Blackmail.find(params[:id]) if params[:id]
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(@blackmail.hustler_id)
    end
  end

  public

  def new
    @blackmail = @user.outgoing_blackmails.build(:hustler_id => params[:user_id])
    @victim = User.new
  end

  def create
    if @victim = User.find_by_email(params[:user][:email])
    else @victim = User.create(
      :name => params[:user][:email],
      :email => params[:user][:email]
    )
    end
#    @blackmail = @user.outgoing_blackmails.build(params[:blackmail], :victim_id => @victim.id)
    @blackmail = @user.outgoing_blackmails.build(params[:blackmail].merge({:victim_id =>@victim.id}) )
    if @blackmail.save
      flash[:success] = "yay"
      redirect_to user_blackmail_path(@user, @blackmail)
    else
      flash[:error] = "no"
      render 'new'
    end
  end

end
