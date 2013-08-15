module ApplicationHelper
  #Assumes that the redirect_uri is already configured for inclusion in a Facebook page tab, see: https://developers.facebook.com/docs/appsonfacebook/pagetabs/
  def facebook_page_integration_link
    "https://www.facebook.com/dialog/pagetab?app_id=#{FACEBOOK_APP_ID}&redirect_uri=#{request.protocol}#{request.host_with_port}/"
  end
end