require 'rails_helper'

feature 'user signs in' do
  scenario 'an existing user specifies a valid username and password' do
    pending
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content('Sign Out')

  end

end
