require 'rails_helper'

feature "user creates review" do

let!(:bar){Bar.create(name: "Punters", address: "40 Huntington Ave", city: "Boston", state: "MA", zip: "02120", description: "An awful college dive bar.")}


  scenario "user fills out review creation form successfully" do
    visit bars_path
    click_link bar.name

    fill_in "Review Body", with: "place sucked!"
    fill_in "Rating", with: "2"
    fill_in "Price", with: "4"

    click_button "Create Review"

    expect(page).to have_content("place sucked!")
    expect(page).to have_content("2")
    expect(page).to have_content("4")
  end

  scenario "user fills out review creation form unsuccessfully" do
    visit bars_path
    click_link bar.name

    fill_in "Review Body", with: ""
    fill_in "Rating", with: ""
    fill_in "Price", with: ""

    click_button "Create Review"

    expect(page).to have_content("Body can't be blank, Rating can't be blank, Price can't be blank")
  end
end
