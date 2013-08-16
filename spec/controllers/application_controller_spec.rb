require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationController do
  include Devise::TestHelpers

  describe 'login' do
    describe 'redirecting without FB page cookies' do
      after(:each) do
        expect(flash[:alert]).to be_nil
      end

      it 'should redirect to admin page correctly' do
        admin_user = FactoryGirl.create(:admin)
        sign_in admin_user

        get 'redirect'

        response.should redirect_to users_path
      end

      it 'should redirect to provider admin page correctly' do
        provider_admin = FactoryGirl.create(:provider_admin)
        sign_in provider_admin

        get 'redirect'

        response.should redirect_to providers_path
      end

      it 'should redirect to users provider page correctly' do
        provider_user = FactoryGirl.create(:provider_user)
        sign_in provider_user

        get 'redirect'

        response.should redirect_to healthpost_path(id: provider_user.provider_id)
      end
    end

    describe 'redirecting with FB page cookies' do
      after(:each) do
        expect(response.cookies[:page_id]).to be_nil
        expect(response.cookies[:page_admin]).to be_nil
      end

      it 'should redirect to admin page correctly' do
        admin_user = FactoryGirl.create(:admin)
        request.cookies[:page_id] = 'x'
        request.cookies[:page_admin] = 'false'
        sign_in admin_user

        get 'redirect'

        expect(flash[:alert]).to be_nil
        response.should redirect_to users_path
      end

      it 'should redirect to provider admin page correctly with good cookies' do
        provider_admin = FactoryGirl.create(:provider_admin)
        request.cookies[:page_id] = provider_admin.provider.fb_page_id
        request.cookies[:page_admin] = 'true'
        sign_in provider_admin

        get 'redirect'

        expect(flash[:alert]).to be_nil
        response.should redirect_to providers_path
      end

      it 'should redirect to logout correctly with bad page_id cookie' do
        provider_admin = FactoryGirl.create(:provider_admin)
        request.cookies[:page_id] = '123'
        request.cookies[:page_admin] = 'true'
        sign_in provider_admin

        get 'redirect'

        expect(flash[:alert]).to eq('Incorrect username or password')
        response.should redirect_to destroy_user_session_path
      end

      it 'should redirect to logout correctly with bad page_admin cookie' do
        provider_admin = FactoryGirl.create(:provider_admin)
        request.cookies[:page_id] = provider_admin.provider.fb_page_id
        request.cookies[:page_admin] = 'false'
        sign_in provider_admin

        get 'redirect'

        expect(flash[:alert]).to eq('Incorrect username or password')
        response.should redirect_to destroy_user_session_path
      end

      it 'should redirect to users provider page correctly with good cookies' do
        provider_user = FactoryGirl.create(:provider_user)
        request.cookies[:page_id] = provider_user.provider.fb_page_id
        request.cookies[:page_admin] = 'false'
        sign_in provider_user

        get 'redirect'

        expect(flash[:alert]).to be_nil
        response.should redirect_to healthpost_path(id: provider_user.provider_id)
      end

      it 'should redirect to logout correctly with bad page_id cookie' do
        provider_user = FactoryGirl.create(:provider_user)
        request.cookies[:page_id] = '123'
        request.cookies[:page_admin] = 'false'
        sign_in provider_user

        get 'redirect'

        expect(flash[:alert]).to eq('Incorrect username or password')
        response.should redirect_to destroy_user_session_path
      end
    end
  end
end