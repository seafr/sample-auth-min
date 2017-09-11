class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your account has been created."
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account has been updated."
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User account deleted"
    redirect_to users_url
  end

  private

    def user_params
      # only allow some attributes to prevent mass assignment
      params.require(:user).permit(:name, :username, :password,
      				   :password_confirmation)
    end
    def logged_in_user
      unless user_logged_in?
	flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      # user objects must be the same based on id in URL and session
      unless current_user == @user
        redirect_to root_url
      end
    end
end
