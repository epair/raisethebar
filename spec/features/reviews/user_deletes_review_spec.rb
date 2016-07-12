require "rails_helper"

feature "user deletes review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id) }
  let!(:review1) { FactoryGirl.create(:review, bar_id: bar.id, user_id: user.id) }

  scenario "user deletes review successfully" do
    login_user(user)
    click_link "Profile"
    click_link "Delete"
    expect(page).to_not have_content(review1.body)
  end
end
