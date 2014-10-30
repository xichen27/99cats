class UsersController < ApplicationController
  before_action :redirect_if_signed_in
  
  def new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    login_user!
    redirect_to cats_url
  end
  
  def redirect_if_signed_in
    if @user = current_user
      redirect_to cats_url
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
