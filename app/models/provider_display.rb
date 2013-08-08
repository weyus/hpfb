class ProviderDisplay < ActiveRecord::Base
  belongs_to :provider
end

# == Schema Information
#
# Table name: provider_displays
#
#  id            :integer          not null, primary key
#  provider_id   :integer
#  scss_filename :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

