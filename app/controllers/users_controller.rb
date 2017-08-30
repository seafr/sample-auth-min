class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
