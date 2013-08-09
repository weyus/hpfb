class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def redirector
    redirect_to current_user.admin? || current_user.provider_admin? ? dashboard_path : provider_path(current_user.provider_id)
  end
end
