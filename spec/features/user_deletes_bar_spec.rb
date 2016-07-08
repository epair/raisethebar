require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'user deletes bar' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }

  scenario 'user visits bar show page and deletes bar' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link bar.name
    click_link 'Delete'

    expect(Bar.all).to eq([])
    expect(page).to_not have_content(bar.name)
    expect(page).to have_content('List of Bars')
    expect(current_url).to eq('http://www.example.com/bars')
  end
  scenario 'user does not see delete link on bar detail page they did not create' do
    user2 = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user2.username
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    click_link bar.name

    expect(page).to_not have_content('Delete')
  end
end
