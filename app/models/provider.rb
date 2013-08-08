class Provider < ActiveRecord::Base
  has_one :provider_facebook_page, :dependent => :destroy
  has_one :provider_display, :dependent => :destroy
  has_many :users

  after_create :create_provider_display
end

# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

