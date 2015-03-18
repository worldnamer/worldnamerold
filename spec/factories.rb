FactoryGirl.define do
  factory :user do
    factory :worldnamer do
      email 'worldnamer@worldnamer.com'
      password 'password'
      password_confirmation 'password_confirmation'
    end
  end
end