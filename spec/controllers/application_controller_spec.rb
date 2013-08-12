require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationController do
  include Devise::TestHelpers

  describe 'login' do
    it 'should redirect to admin page correctly' do
      admin_user = FactoryGirl.create(:admin)
      sign_in admin_user

      get 'redirect'

      response.should redirect_to dashboard_path
    end

    it 'should redirect to users provider page correctly' do
      provider_user = FactoryGirl.create(:provider_user)
      sign_in provider_user

      get 'redirect'

      response.should redirect_to healthpost_path(id: provider_user.provider_id)
    end
  end
end