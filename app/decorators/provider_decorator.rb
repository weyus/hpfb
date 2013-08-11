class ProviderDecorator < Draper::Decorator
  delegate_all

  delegate :fb_page_id, to: :provider_facebook_page, allow_nil: true
  delegate :scss_filename, to: :provider_display, allow_nil: true

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
