require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in' do
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario 'admin logs in and sees admin power' do
    visit '/'
    click_link 'Sign In'
    login_user(admin)
    
    expect(page).to have_content('Admin Power')
  end
end
