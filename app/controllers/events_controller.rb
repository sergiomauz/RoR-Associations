class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id) 
    @event = @user.created_events.new(event_params)
    @event.save

    redirect_to event_path(@event.id)
  end

  def show
    @event = Event.find(params[:id])
  end
  
  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
