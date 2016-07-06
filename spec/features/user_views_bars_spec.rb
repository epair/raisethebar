require "rails_helper"

# As an authenticated user
# I want to view a list of bars
# So that I can pick bars to review

feature "user views list of bars" do
  let!(:bar){Bar.create(name: "Punters", address: "40 Huntington Ave", city: "Boston", state: "MA", zip: "02120")}

  let!(:bartwo){Bar.create(name: "Conner's", address: "20 Tremont Ave", city: "Boston", state: "MA", zip: "02115")}

  scenario "user sees list of bars" do
    visit bars_path
    expect(page).to have_content("List of Bars")
    expect(page).to have_content(bar.name)
    expect(page).to have_content(bartwo.name)
  end
end
