class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if (@user and @user.username == params[:username] and @user.password == params[:password])
    	session[:user_id] = @user.id
    	redirect_to laptops_path
    else 
    	render :new
    end
  end

  def log_out
    session[:user_id] = ''
    redirect_to laptops_path
  end
end
