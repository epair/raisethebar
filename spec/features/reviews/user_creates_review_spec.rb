require 'rails_helper'

feature "user creates review" do
  let!(:bar){ FactoryGirl.create(:bar, user_id: user.id) }
  let!(:user){ FactoryGirl.create(:user) }

  scenario "user fills out review creation form successfully" do
    login_user(user)
    click_link bar.name

    fill_in "Review Body", with: "place sucked!"
    fill_in "Title", with: "Title"
    fill_in "Rating", with: "2"
    fill_in "Price", with: "4"

    click_button "Create Review"

    expect(page).to have_content("place sucked!")
    expect(page).to have_content("2")
    expect(page).to have_content("4")
  end

  scenario "user fills out review creation form unsuccessfully" do
    login_user(user)
    click_link bar.name

    fill_in "Review Body", with: ""
    fill_in "Rating", with: ""
    fill_in "Price", with: ""

    click_button "Create Review"

    expect(page).to have_content("Body can't be blank, Rating can't be blank, Rating is not a number, Rating is the wrong length (should be 1 character), Price can't be blank, Price is not a number, Price is the wrong length (should be 1 character), Title can't be blank")
  end
end
