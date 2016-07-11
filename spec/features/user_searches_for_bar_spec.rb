require 'rails_helper'
# As an authenticated user
# I want to search for a bar
# So that I can view the search results

# Acceptance Criteria:
# [] Requires input - there is an error when none is provided
# [] user is signed in
# [] results appear on a new page
feature 'user signs in and user searches for bar' do
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id, name: "Punters") }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_user(user)
  end

  scenario 'user fills out search creation form successfully' do
    fill_in 'q', with: 'Pu'
    click_button 'Search'

    expect(page).to have_content('Punters')
  end

  scenario 'user fills out search creation form successfully with no matches' do
    fill_in 'q', with: 'salami'
    click_button 'Search'

    expect(page).to have_content('There were no Bars found with the following criteria: salami.')
  end

  scenario 'user clicks search with an empty field' do
    click_button 'Search'

    expect(page).to have_content('Search Criteria Cannot Be Blank')
  end
end
