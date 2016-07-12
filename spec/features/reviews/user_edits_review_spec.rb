require "rails_helper"

feature "user edits review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id) }
  let!(:review1) { FactoryGirl.create(:review, bar_id: bar.id, user_id: user.id) }

  scenario "review creator edits review successfully" do
    login_user(user)
    click_link "Profile"

    expect(page).to have_content(review1.body)
    click_link "Edit"
    fill_in "Title", with: "The Mission"
    fill_in "Review Body", with: "Bum bah bah bah"
    choose 'review_rating_2'
    choose 'review_price_3'
    click_button "Update Review"

    expect(page).to have_content("Review successfully updated!")
    expect(page).to have_content("The Mission")
    expect(page).to have_content("Bum bah bah bah")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end

  scenario "review creator edits review unsuccessfully" do
    login_user(user)
    click_link "Profile"

    expect(page).to have_content(review1.body)
    click_link "Edit"
    fill_in "Review Body", with: ""
    fill_in "Title", with: ""
    choose 'review_rating_2'
    choose 'review_price_3'
    click_button "Update Review"

    expect(page).to have_content("Body can't be blank, Title can't be blank")
  end
end
