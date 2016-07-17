require 'rails_helper'

feature 'sign up' do
  scenario 'specifying valid and required information' do
    visit '/'
    click_link 'Sign In'
    click_link 'Sign up'
    fill_in 'Username', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Log in")
  end
end
