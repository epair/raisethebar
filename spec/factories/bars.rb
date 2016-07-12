FactoryGirl.define do
  factory :bar do
    sequence(:name) { |n| "Bar#{n}" }
    sequence(:address) { |m| "#{m} Huntington Ave" }
    city 'Boston'
    state 'MA'
    zip '02120'
    photo_url 'http://animals.sandiegozoo.org/sites/default/files/juicebox_slides/capybara_06.jpg'
  end
end
