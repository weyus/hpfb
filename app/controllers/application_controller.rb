class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #The "signed_in" logic is necessary to avoid an endless redirection loop
  def redirect
    if user_signed_in?
      #Associate the Facebook page if a Facebook page association request comes in
      if current_user.provider_admin? && params[:tabs_added]
        current_user.provider.associate_fb_page(params[:tabs_added].keys.first)
      end

      #Redirect appropriately, with additional FB page permission checks if possible.
      redirect_target = if current_user.admin?
                          users_path
                        elsif current_user.provider_admin?
                          (check_provider_id && check_provider_admin) ? providers_path : destroy_user_session_path
                        else
                          check_provider_id ? healthpost_path(current_user.provider_id) : destroy_user_session_path
                        end

      #Destroy the cookies
      cookies.delete :page_id
      cookies.delete :page_admin

      #Put a message up if we denied entry - nice and vague
      flash[:alert] = 'Incorrect username or password' if redirect_target == destroy_user_session_path

      redirect_to redirect_target
    else
      redirect_to new_user_session_path
    end
  end

  private

  def check_provider_id
    (! cookies['page_id']) || (cookies['page_id'] == current_user.provider.fb_page_id)
  end

  def check_provider_admin
    (! cookies['page_admin']) || (cookies['page_admin'] == current_user.provider_admin?.to_s)
  end
end


