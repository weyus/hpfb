FactoryGirl.define do
  sequence(:name) {|n| "Provider#{n}"}

  factory :provider do
    name {generate(:name)}
  end
end
