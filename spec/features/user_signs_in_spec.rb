require 'rails_helper'

feature 'user signs in' do
  scenario 'an existing user specifies a valid username and password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')

  end
  scenario 'user specifies invalid username and password' do
    visit new_user_session_path
    fill_in 'Username', with: 'WhoamI'
    fill_in 'Password', with: 'notmypassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid Username or password')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Sign Out')
  end
  scenario 'user is already signed in and cannot sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end
  scenario 'user signs out and returns to sign in menu' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'

    expect(page).to have_content('Sign up')
  end

end
