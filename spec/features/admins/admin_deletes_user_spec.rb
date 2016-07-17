require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in and deletes a user' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'create a user and admin logs in and deletes user' do
    login_user(admin)
    click_link 'Admin Power'
    first(:link, "Delete").click

    expect(page).to have_content("User Deleted")
    expect(page).to_not have_content(user.username)
  end
end
