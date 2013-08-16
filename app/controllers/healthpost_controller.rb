class HealthpostController < ApplicationController
  include FacebookUtil

  before_filter :authenticate_user!, except: [:facebook_page]
  skip_before_filter :verify_authenticity_token, only: [:facebook_page]

  def show
  end

  def facebook_page
    success = false

    begin
      #Check that this is a valid call from a Facebook tab (POST with signed_request parameter)
      if request.env['HTTP_REFERER'] =~ /facebook\.com\// && params[:signed_request].present?
        #Pull the data out of the signed request
        if sr_data = get_fb_signed_request_data
          cookies[:page_id] = sr_data[:page][:id]
          cookies[:page_admin] = sr_data[:page][:admin]
          success = true
        end
      end
    rescue Exception => e
      logger.error("Exception encountered when application accessed via Facebook page tab: #{e.message}\n#{e.backtrace}")
    end

    render status: success ? :ok : :unprocessable_entity
  end
end