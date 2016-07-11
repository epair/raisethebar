FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |m| "user#{m}@example.com" }
    password 'password'
    password_confirmation 'password'
    profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', '12745435_1562446170747216_2647897519653711469_n.jpg')) }
  end
end
