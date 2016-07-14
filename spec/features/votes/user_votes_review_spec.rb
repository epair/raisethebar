require "rails_helper"

feature "user votes on a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  let!(:review) { FactoryGirl.create(:review, bar: bar, user: user) }

  before do
    login_user(user)
    click_link bar.name
  end

  scenario "user clicks on upvote button for the first time" do
    click_button "Upvote"
    expect(page).to have_content(1)
  end

  scenario "user clicks on upvote button for the second time" do
    click_button "Upvote"
    click_button "Upvote"
    expect(page).to have_content(0)
  end

  scenario "user clicks on downvote button for the first time" do
    click_button "Downvote"
    expect(page).to have_content(-1)
  end

  scenario "user clicks on downvote button for the second time" do
    click_button "Downvote"
    click_button "Downvote"
    expect(page).to have_content(0)
  end

  scenario "user clicks on downvote button after clicking upvote button" do
    click_button "Upvote"
    click_button "Downvote"
    expect(page).to have_content(-1)
  end
end
