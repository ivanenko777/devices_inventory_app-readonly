class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    session[:user_id] ? User.find_by(id: session[:user_id]) : nil
  end

  def logged_in?
    !current_user.nil?
  end
end
