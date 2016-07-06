require "rails_helper"

feature "user views reviews" do
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

  scenario "user sees all reviews for the bar on the bar show page" do
    visit bars_path
    click_link bar.name

    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.price)
  end
end
