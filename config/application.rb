require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module HealthpostFacebook
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # This only works in Firefox currently, maybe we could use it when everyone else has caught up WG 08/14/13
    #config.action_dispatch.default_headers['X-Frame-Options'] = 'ALLOW-FROM https://www.facebook.com'

    # Better way to handle default headers per: https://coderwall.com/p/k7xlxa
    config.action_dispatch.default_headers = {
      'X-XSS-Protection' => '1; mode=block',
      'X-Content-Type-Options' => 'nosniff'
    }

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
    end

    Date::DATE_FORMATS[:default] = "%m/%d/%Y"
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
