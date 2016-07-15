require "rails_helper"

feature "user votes on a review", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user: user) }
  let!(:review) { FactoryGirl.create(:review, bar: bar, user: user) }

  before do
    login_user(user)
    click_link bar.name
  end

  scenario "user clicks on upvote button for the first time" do
    find('#upvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('1')
  end

  scenario "user clicks on upvote button for the second time" do
    find('#upvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('1')
    find('#upvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('0')
  end

  scenario "user clicks on downvote button for the first time" do
    find('#downvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('-1')
  end

  scenario "user clicks on downvote button for the second time" do
    find('#downvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('-1')
    find('#downvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('0')
  end

  scenario "user clicks on downvote button after clicking upvote button" do
    find('#upvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('1')
    find('#downvote-submit-1').trigger('click')
    expect(find('div#review-sum-1')).to have_content('-1')
  end
end
