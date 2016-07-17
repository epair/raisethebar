require 'rails_helper'

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature 'admin logs in and deletes a bar' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id) }

  scenario 'create a user and have user create bar' do
    visit '/'
    click_link 'Sign In'
    login_user(user)
    click_link 'Add Bar'
    fill_in 'Name', with: 'Jacob Wirths'
    fill_in 'Address', with: '31 Stewart Street'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'Massachusetts'
    fill_in 'Zip', with: '02120'
    fill_in 'Bar Image', with: 'http://animals.sandiegozoo.org/sites/default/files/juicebox_slides/capybara_06.jpg'
    click_button 'Create Bar'

    expect(page).to have_content('Jacob Wirths')
    expect(page).to have_content('31 Stewart Street')
    expect(page).to have_content('Boston')
    expect(page).to have_content('Massachusetts')
    expect(page).to have_content('02120')

    #user creates review 

    #sign out current user so admin can sign in
    click_link 'Sign Out'
    #Admin logs in now and sees the bar the user created
    visit '/'
    click_link 'Sign In'
    login_user(admin)

    expect(page).to have_content('Jacob Wirths')

    #Admin visits bar page and sees delete bar link
    click_link 'Jacob Wirths'

    expect(page).to have_content('Delete Bar (Admin Power)')

    #admin deletes bar
    click_link 'Delete Bar (Admin Power)'

    expect(page).to_not have_content('Jacob Wirths')
  end
end
