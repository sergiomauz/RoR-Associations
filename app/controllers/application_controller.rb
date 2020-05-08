class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :is_attended?


  def is_attended?(event_id)
    return true if current_user.attended_events.where(id: event_id)[0]

    false
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
