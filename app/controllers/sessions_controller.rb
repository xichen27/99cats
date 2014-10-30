class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, except: [:destroy]
  
  def create
    @user = User.find_by_credentials(
            params[:user][:user_name], params[:user][:password])

    if @user.nil?
      render :new
      return
    end
    
    login_user!
    
    redirect_to cats_url
  end
  
  def new
    render :new
  end
  
  def redirect_if_signed_in
    if @user = current_user
      redirect_to cats_url
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
  
  
end
