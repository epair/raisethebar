require "rails_helper"

feature "user edits review" do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }
  let!(:review1){ FactoryGirl.create(:review, bar_id: bar.id, user_id: user.id)}

  scenario "review creator edits review successfully" do
    login_user(user)
    click_link "Profile"

    expect(page).to have_content(review1.body)
    click_link "Edit Review"
    fill_in "Title", with: "The Mission"
    fill_in "Review Body", with: "Bum bah bah bah"
    fill_in "Rating", with: "2"
    fill_in "Price", with: "3"
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
    click_link "Edit Review"
    fill_in "Review Body", with: ""
    fill_in "Title", with: ""
    fill_in "Rating", with: "askjdhfksjh"
    fill_in "Price", with: ""
    click_button "Update Review"

    expect(page).to have_content("Body can't be blank, Rating is not a number, Rating is the wrong length (should be 1 character), Price can't be blank, Price is not a number, Price is the wrong length (should be 1 character), Title can't be blank")
  end
end
