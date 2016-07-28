require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in and deletes a bar' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id, name: "Jacob Wirth's") }

  scenario 'create a user and have user create bar' do
    login_user(admin)
    click_link bar.name

    expect(page).to have_content('Delete Bar (Admin Power)')

    click_link 'Delete Bar (Admin Power)'

    expect(page).to_not have_content(bar.name)
  end
end
