class ProviderDisplay < ActiveRecord::Base
  belongs_to :provider

  after_create :generate_display_scss
  before_destroy :delete_display_scss

  def self.display_scss_dir
    @@display_scss_dir ||= (Rails.env == 'test' ? "#{Rails.root}/spec/tmp" : "#{Rails.root}/app/assets/stylesheets/providers")
  end

  def self.default_display_scss
    "#{display_scss_dir}/provider_default.css.scss"
  end

  private

  def generate_display_scss
    scss_filename = "#{ProviderDisplay.display_scss_dir}/#{provider.name.gsub(/\s+/, '_')}.css.scss"
    FileUtils.cp(ProviderDisplay.default_display_scss, scss_filename) unless File.exist?(scss_filename)
    update_attribute(:scss_filename, scss_filename)
  end

  def delete_display_scss
    FileUtils.rm(scss_filename) if scss_filename && File.exist?(scss_filename)
  end
end

# == Schema Information
#
# Table name: provider_displays
#
#  id            :integer          not null, primary key
#  provider_id   :integer          not null
#  scss_filename :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

