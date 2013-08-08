class ProviderController < ApplicationController
  def show
    return redirect_to admin_path if current_user.is_admin?
  end
end
