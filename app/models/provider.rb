class Provider < ActiveRecord::Base
  has_one :provider_facebook_page
  has_one :provider_display
  has_many :users
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

