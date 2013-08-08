class ProviderFacebookPage < ActiveRecord::Base
  belongs_to :provider
end

# == Schema Information
#
# Table name: provider_facebook_pages
#
#  id          :integer          not null, primary key
#  provider_id :integer          not null
#  fb_page_id  :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

