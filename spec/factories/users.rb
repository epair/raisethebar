FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |m| "user#{m}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
