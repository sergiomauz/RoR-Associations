class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(username: params[:session][:username])[0]
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'Logged in!'
    else
      flash.now[:alert] = 'Invalid Username'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
