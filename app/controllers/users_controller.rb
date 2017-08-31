class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      # only allow some attributes to prevent mass assignment
      params.require(:user).permit(:name, :username, :password,
      				   :password_confirmation)
    end
end
