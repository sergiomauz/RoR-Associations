class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User Created'
      redirect_to new_session_path
    else
      flash.now[:alert] = 'Failed to create user'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.prev_events
  end

  def attend
    event = Event.find(params[:id])
    current_user.attended_events << event
    redirect_to event_path(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
