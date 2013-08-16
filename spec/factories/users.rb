FactoryGirl.define do
  sequence(:random_string) {|n| SecureRandom.hex}
  sequence(:user_email) {|n| "somebody#{n}@test.com"}

  factory :user do
    email {generate(:user_email)}
    password {generate(:random_string)}

    factory :admin do
      admin true
    end

    factory :provider_admin do
      association :provider, factory: :provider
      provider_admin true
    end

    factory :provider_user do
      association :provider, factory: :provider
    end
  end
end
