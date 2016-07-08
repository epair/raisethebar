require 'rails_helper'

feature 'user sees bar details' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }

  scenario 'user views details of a bar on its show page' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit bars_path
    click_link bar.name

    expect(page).to have_content(bar.name)
    expect(page).to have_content(bar.address)
    expect(page).to have_content(bar.city)
    expect(page).to have_content(bar.state)
    expect(page).to have_content(bar.zip)
    expect(page).to have_content(bar.description)
  end
end
