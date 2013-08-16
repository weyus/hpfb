FactoryGirl.define do
  sequence(:page_id) {|n| "FB_Page#{n}"}

  factory :provider_facebook_page do
    fb_page_id {generate(:page_id)}
  end
end
