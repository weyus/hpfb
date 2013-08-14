class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect
    if user_signed_in?
      redirect_target = if current_user.admin?
                          users_path
                        elsif current_user.provider_admin?
                          providers_path
                        else
                          healthpost_path(current_user.provider_id)
                        end
      redirect_to redirect_target
    else
      redirect_to new_user_session_path
    end
  end
end
