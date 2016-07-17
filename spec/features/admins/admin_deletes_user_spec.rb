require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in and deletes a user' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'create a user and admin logs in and deletes user' do
    visit '/'
    click_link 'Sign In'
    login_user(user)
    click_link 'Sign Out'
    visit '/'
    click_link 'Sign In'
    login_user(admin)
    click_link 'Admin Power'

    expect(page).to have_content("Delete #{user.username}")
    expect(page).to have_content("Delete #{admin.username}")

    click_link "Delete #{user.username}"

    expect(page).to have_content("User Deleted")
  end
end
