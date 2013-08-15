class HealthpostController < ApplicationController
  before_filter :authenticate_user!, except: [:associate_fb_page]
  skip_before_filter :verify_authenticity_token, only: [:facebook_page]

  def show
  end

  def facebook_page
    #Check that this is a valid call from a Facebook tab
    if (request.env['HTTP_REFERER'] =~ /facebook\.com\//) && params[:signed_request].present?
      response.headers.delete('X-Frame-Options')
      render js: "window.location = '#{root_url}'"
    else
      render status: :unprocessable_entity
    end
  end
end