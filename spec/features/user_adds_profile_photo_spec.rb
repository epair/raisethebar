require 'rails_helper'

feature 'add profile photo' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user uploads failing filetype' do
    visit '/'
    fill_in 'Username', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file 'Profile photo', "#{Rails.root}/spec/support/authentication_helper.rb"
    click_button 'Sign Up'

    expect(page).to have_content("Profile photo file should be one of image/jpeg, image/png, image/jpg")
  end

  scenario 'specifying valid and required information' do
    login_user(user)
    click_link 'Profile'
    expect(page).to have_css("img[src*='12745435_1562446170747216_2647897519653711469_n.jpg']")
  end
end
