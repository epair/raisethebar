require "rails_helper"

feature "user views reviews" do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }
  let!(:review1){ FactoryGirl.create(:review, bar_id: bar.id, user_id: user.id)}

  scenario "user sees all reviews for the bar on the bar show page" do
    login_user(user)
    click_link bar.name

    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.price)
  end
end
