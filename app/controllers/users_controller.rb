class UsersController < ApplicationController
  before_action :check_if_admin, :only => [:index, :destroy]
  
  def index
    if params[:search]
      @users = User.search(params[:search]).order(:last_name)
    else
      @users = User.order(:last_name)
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :image)
  end

  def check_if_admin
    redirect_to(login_path) unless @current_user.present? && @current_user.is_admin?
  end
end
