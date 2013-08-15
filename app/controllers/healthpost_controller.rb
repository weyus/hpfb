class HealthpostController < ApplicationController
  before_filter :authenticate_user!, except: [:associate_fb_page]
  skip_before_filter :verify_authenticity_token, only: [:facebook_page]

  def show
  end

  def facebook_page
    #Check that this is a valid call from a Facebook tab
    return render status: :unprocessable_entity unless params[:signed_request]
    logger.info "Signed request: #{params[:signed_request]}"

    redirect_to root_url
  end
end