require 'rails_helper'

# As an authenticated user
# I want to add a bar
# So that others can review it

# Acceptance Criteria:
# [] Requires name and address - there is an error when none is provided
# [] Name is unique
# [] user is signed in

feature 'user signs in and user creates bar' do
  before do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'user fills out bar creation form successfully' do
    click_link 'Add Bar'
    fill_in 'Name', with: 'Jacob Wirths'
    fill_in 'Address', with: '31 Stewart Street'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'Massachusetts'
    fill_in 'Zip', with: '02120'

    click_button 'Create Bar'

    expect(page).to have_content('Jacob Wirths')
    expect(page).to have_content('31 Stewart Street')
    expect(page).to have_content('Boston')
    expect(page).to have_content('Massachusetts')
    expect(page).to have_content('02120')
  end

  scenario 'user fills out bar creation form unsuccessfully' do
    click_link 'Add Bar'
    fill_in 'Name', with: ''
    fill_in 'Address', with: ''
    fill_in 'City', with: ''
    fill_in 'State', with: ''
    fill_in 'Zip', with: ''

    click_button 'Create Bar'

    expect(page).to have_content("Name can't be blank, Address can't be blank")
    expect(page).to have_content("State can't be blank, City can't be blank")
    expect(page).to have_content("Zip can't be blank, Zip is not a number")
    expect(page).to have_content("Zip is the wrong length")
  end
end
