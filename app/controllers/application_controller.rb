class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  private

  def to_s
     current_user_session.try.record
  end

  def current_user_session
    UserSession.find
  end

  def login_required
    redirect_to to_param("#{:id}-#{root_path}"), :notice => "You must be logged in to do that." unless logged_in?
  end

  def logged_in?
    !!current_user
  end


  helper_method :current_user, :logged_in?
end

