require 'rails_helper'

feature 'user edits bar' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }

  scenario 'user visits detail page and edits bar info successfully' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link bar.name
    click_link 'Edit'

    fill_in 'Name', with: 'The Mission'
    fill_in 'Address', with: '20 Huntington Ave'

    click_button 'Update Bar'

    expect(page).to have_content('The Mission')
    expect(page).to have_content('20 Huntington Ave')
    expect(page).to_not have_content(bar.name)
    expect(page).to_not have_content(bar.address)
  end

  scenario 'user visits detail page and edits bar info unsuccessfully' do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit bars_path
    click_link bar.name
    click_link 'Edit'

    fill_in 'Name', with: 'The Mission'
    fill_in 'Address', with: ''
    fill_in 'Zip', with: 'unknown'
    click_button 'Update Bar'

    expect(page).to have_content("Address can't be blank, Zip is not a number,")
    expect(page).to have_content("Zip is the wrong length (should be 5 characters)")
  end
  scenario 'user does not see edit link on bar detail page they did not create' do
    user2 = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Username', with: user2.username
    fill_in 'Password', with: user2.password
    click_button 'Log in'
    click_link bar.name

    expect(page).to_not have_content('Edit')
  end
end
