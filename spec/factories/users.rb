FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |m| "user#{m}@example.com" }
    password 'password'
    password_confirmation 'password'
    after :create do |b|
      b.update_column(:profile_photo, "#{Rails.root}/spec/support/12745435_1562446170747216_2647897519653711469_n.jpg")
    end
  end
end
