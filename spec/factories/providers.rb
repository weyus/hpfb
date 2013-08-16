FactoryGirl.define do
  sequence(:name) {|n| "Provider#{n}"}

  factory :provider do
    name {generate(:name)}
    association :provider_facebook_page, factory: :provider_facebook_page, strategy: :build
  end
end