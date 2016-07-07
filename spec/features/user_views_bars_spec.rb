require 'rails_helper'

# As an authenticated user
# I want to view a list of bars
# So that I can pick bars to review

feature 'user views list of bars' do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:bar) do
    Bar.create(
      name: 'Punters',
      address: '40 Huntington Ave',
      city: 'Boston',
      state: 'MA',
      zip: '02120'
    )
  end

  let!(:bartwo) do
    Bar.create(
      name: 'Conners',
      address: '20 Tremont Ave',
      city: 'Boston',
      state: 'MA',
      zip: '02115'
    )
  end

  scenario 'user sees list of bars' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit bars_path
    expect(page).to have_content('List of Bars')
    expect(page).to have_content(bar.name)
    expect(page).to have_content(bartwo.name)
  end
end
