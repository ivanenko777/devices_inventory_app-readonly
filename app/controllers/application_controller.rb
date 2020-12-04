class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.curr_user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    User.curr_user
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to login_url, alert: 'Please login!' unless logged_in?
  end
end
