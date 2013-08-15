class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #after_filter :remove_x_frame_options_header

  def redirect
    if user_signed_in?
      #Associate the Facebook page if a Facebook page association request comes in
      if current_user.provider_admin? && params[:tabs_added]
        current_user.provider.associate_fb_page(params[:tabs_added].keys.first)
      end

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

  private

  #If the request comes from Facebook, remove the X-Frame-Options header. Only do this for the first request.
  #def remove_x_frame_options_header
  #  if session['fb_request']
  #
  #    session[:fb_request] = nil
  #  end
  #end
end
