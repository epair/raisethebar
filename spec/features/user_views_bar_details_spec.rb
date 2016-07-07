require 'rails_helper'


feature 'user sees bar details' do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:bar) do
    Bar.create(
      name: 'Punters',
      address: '40 Huntington Ave',
      city: 'Boston',
      state: 'MA',
      zip: '02120',
      description: 'An awful college dive bar.',
      user_id: user.id
    )
  end

  scenario 'user views details of a bar on its show page' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit bars_path
    click_link 'Punters'

    expect(page).to have_content(bar.name)
    expect(page).to have_content(bar.address)
    expect(page).to have_content(bar.city)
    expect(page).to have_content(bar.state)
    expect(page).to have_content(bar.zip)
    expect(page).to have_content(bar.description)
  end
end
