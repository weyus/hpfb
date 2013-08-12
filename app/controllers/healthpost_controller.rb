class HealthpostController < ApplicationController
  def show
  end

  def associate_fb_page
    render text: 'Associated!'
  end
end