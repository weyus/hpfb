class ProvidersController < ApplicationController
  def show
    return redirect_to admin_path if current_user.admin?
  end
end
