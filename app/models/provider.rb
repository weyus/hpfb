class Provider < ActiveRecord::Base
  has_one :provider_facebook_page
  has_one :provider_display
  has_many :users
end
