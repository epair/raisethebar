require "rails_helper"

feature "user edits review" do
  let!(:bar) do
    Bar.create(
      name: "Punters",
      address: "40 Huntington Ave",
      city: "Boston",
      state: "MA",
      zip: "02120"
    )
  end
  let!(:review1) do
    Review.create(
    body: "this is a review",
    rating: "4",
    price: "1",
    bar_id: bar.id
  )
  end

  scenario "review creator edits review successfully" do
    visit bars_path
    click_link bar.name

    expect(page).to have_content(review1.body)

    click_link "Edit Review"
    fill_in "Review Body", with: "The Mission"
    fill_in "Rating", with: "2"
    fill_in "Price", with: "3"
    click_button "Update Review"

    expect(page).to have_content("The Mission")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end

  scenario "review creator edits review unsuccessfully" do

  end

  xscenario "user (who didn't create review) attempts to edit review" do

  end
end
