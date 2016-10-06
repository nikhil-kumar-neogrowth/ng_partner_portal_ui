class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter CASClient::Frameworks::Rails::Filter
  skip_before_action :verify_authenticity_token

  def user_name
  	session[:cas_user]
  end
  helper_method :user_name
end
