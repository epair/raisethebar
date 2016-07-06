require "rails_helper"

# As a creator of a bar
# I want to delete a bar
# So that no one can review it

feature "user deletes bar" do
  let!(:bar){Bar.create(name: "Punters", address: "40 Huntington Ave", city: "Boston", state: "MA", zip: "02120", description: "An awful college dive bar.")}

  scenario "user visits bar show page and deletes bar" do
    visit bars_path
    click_link "Punters"

    click_link "Delete"

    expect(Bar.all).to eq([])
    expect(page).to_not have_content(bar.name)
    expect(page).to have_content("List of Bars")
    expect(current_url).to eq("http://www.example.com/bars")
    
  end
end
