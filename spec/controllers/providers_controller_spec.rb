require File.dirname(__FILE__) + '/../spec_helper'

describe ProvidersController do
  include Devise::TestHelpers

  describe 'login' do
    it 'should redirect to admin page correctly' do
      admin_user = FactoryGirl.create(:admin)
      sign_in admin_user

      get 'show'

      response.should redirect_to admin_url
    end
  end
end