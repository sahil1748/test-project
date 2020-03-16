class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    params[:direction] ||= "ASC"
    params[:sort] ||= "id"

    if params[:reset] == 'true'
      session[:keyword] = ''
    end

    if !params[:count] && session[:keyword] == ''
      @users = User.limit(2)
    end

    if params[:count] && session[:keyword] ==''
      @count = params[:count].to_i
      if @count < User.all.count 
        @users = User.limit(@count+1)
      end
    end

    if params[:keyword]
      session[:keyword] = params[:keyword]
      if params[:keyword] == "true" or params[:keyword] == "false"
        @users = User.where("is_deleted = ?",params[:keyword])
      else
        @users = User.where("name ilike ? or address ilike ? or phoneno ilike ? or username ilike ? or email ilike ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
      end
    end
   
    if session[:keyword]!=''
      @users = User.where("name ilike ? or address ilike ? or phoneno ilike ? or username ilike ? or email ilike ?", "%#{session[:keyword]}%", "%#{session[:keyword]}%", "%#{session[:keyword]}%", "%#{session[:keyword]}%", "%#{session[:keyword]}%")  
    end
   
    @users = @users.order("#{params[:sort]} #{params[:direction]}")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #session[:user_id] = @user.id
      redirect_to users_path
    else 
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      redirect_to users_path
    else 
      render :show
    end
  end
  def soft_delete
    @user = User.find(params[:id])
    if (@user.is_deleted)
      @user.update(is_deleted: false)
    else
      @user.update(is_deleted: true)
    end
    redirect_to users_path
  end

  private 
    def user_params
      params.require(:user).permit(:name,:username,:password,:email,:phoneno,:address,:password_confirmation)
    end

end
