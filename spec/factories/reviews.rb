FactoryGirl.define do
  factory :review do
    sequence(:body) { |n| "body text weeeeee #{n}" }
    rating "1"
    price "3"
  end
end
