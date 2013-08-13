class HealthpostController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:associate_fb_page]

  def show
  end

  def associate_fb_page
    render text: 'Associated!'
  end
end