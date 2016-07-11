require 'rails_helper'

feature 'add profile photo' do

  let!(:user){ FactoryGirl.create(:user) }

  scenario 'specifying valid and required information' do
    login_user(user)
    click_link 'Profile'
    expect(page).to have_css("img[src*='12745435_1562446170747216_2647897519653711469_n.jpg']")
  end
end
