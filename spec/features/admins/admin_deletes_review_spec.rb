require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in and deletes a bar' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id, name: "Jacob Wirth's") }
  let!(:review) { FactoryGirl.create(:review, bar: bar, user: user, title: "place sucked")}

  scenario 'create a user and have user create bar' do
    login_user(admin)
    click_link bar.name
    click_link 'Delete'

    expect(page).to have_content('Review Deleted')
    expect(page).to_not have_content(review.title)
  end
end
