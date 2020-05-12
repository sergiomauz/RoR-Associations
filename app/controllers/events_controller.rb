class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.created_events.new(event_params)
    if @event.save
      flash[:notice] = 'Event Created!'
      redirect_to user_path(current_user.id)
    else
      flash[:error] = 'Failed to create event'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
