FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    password_confirmation 'password_confirmation'

    factory :worldnamer do
      email 'worldnamer@worldnamer.com'
    end
  end

  factory :project do
    user
  end
end