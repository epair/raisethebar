require 'rails_helper'

feature "user creates review" do
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }
  let!(:user){ FactoryGirl.create(:user) }

  scenario "user fills out review creation form successfully" do
    login_user(user)
    click_link bar.name

    fill_in "Review Body", with: "place sucked!"
    fill_in "Title", with: "Title"
    choose 'review_rating_1'
    choose 'review_price_3'

    click_button "Create Review"

    expect(page).to have_content("place sucked!")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end

  scenario "user fills out review creation form unsuccessfully" do
    login_user(user)
    click_link bar.name

    fill_in "Review Body", with: ""
    fill_in "Title", with: ""
    choose 'review_rating_1'
    choose 'review_price_3'
    click_button "Create Review"

    expect(page).to have_content("Body can't be blank, Title can't be blank")
  end
end
