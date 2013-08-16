require File.dirname(__FILE__) + '/../spec_helper'
include FacebookUtil

describe HealthpostController do
  describe 'facebook_page' do
    describe 'should render 422' do
      it 'if the referrer is not facebook.com' do
        request.env['HTTP_REFERER'] = 'junk'

        post 'facebook_page'

        response.status.should == 422
      end

      it 'if the signed request is not present' do
        request.env['HTTP_REFERER'] = 'https://www.facebook.com/WesTestPage/app_633522773325102'

        post 'facebook_page'

        response.status.should == 422
      end

      it 'if the signed request data cannot be extracted' do
        request.env['HTTP_REFERER'] = 'https://www.facebook.com/WesTestPage/app_633522773325102'

        post 'facebook_page', signed_request: 'crap'

        response.status.should == 422
      end
    end

    #describe 'should redirect' do
    #  it 'if everything is in place' do
    #    request.env['HTTP_REFERER'] = 'https://www.facebook.com/WesTestPage/app_633522773325102'
    #    page_hash = {'id' => 1, 'admin' => true, 'liked' => false}
    #    controller.stub(:get_fb_signed_request_data).and_return({'algorithm' => 'HMAC-SHA256', 'issued_at' => 1, 'page' => page_hash, 'user' => {}})
    #
    #    post 'facebook_page', signed_request: 'klqwheoiwyqfo723yo8y2io34h2i3'
    #
    #    response.should redirect_to '/' #Couldn't get route to include query parameters for some reason - blah.
    #  end
    #end
  end
end