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
      flash[:error] = 'Failed to create user'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events    
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :username)
  end

end
