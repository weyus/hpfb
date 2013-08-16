module FacebookUtil
  def fb_application
    FbGraph::Application.new(FACEBOOK_APP_ID, :secret => FACEBOOK_APP_SECRET)
  end

  def get_fb_signed_request_data
    FbGraph::Auth::SignedRequest.verify(fb_application, params[:signed_request])
  end
end