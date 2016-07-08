require 'rails_helper'

# As an authenticated user
# I want to view a list of bars
# So that I can pick bars to review

feature 'user views list of bars' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }
  let!(:bartwo){ FactoryGirl.create(:bar, user_id: user.id) }

  scenario 'user sees list of bars' do
    login_user(user)
    visit bars_path
    expect(page).to have_content('List of Bars')
    expect(page).to have_content(bar.name)
    expect(page).to have_content(bartwo.name)
  end
end
