class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to FindMyView #{@user.name}!"
      redirect_to stunning_views_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def logged_in_user
    unless logged_in?
      store_target_location
      flash[:danger] = "Please log in first."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless correct_user? @user
  end

end