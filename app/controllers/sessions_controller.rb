class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Login successful!"
      redirect_to user
    else
      # use flash.now for rendered pages
      flash.now[:danger] = "Invalid username/password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id) if user_logged_in?
    @current_user = nil
    redirect_to root_url
  end
end
