require "rails_helper"

# As an authenticated user
# I want to add a bar
# So that others can review it

# Acceptance Criteria:
# [] Requires name and address - there is an error when none is provided
# [] Name is unique
# [] user is signed in

feature "user creates bar" do

  # before do
  #   @name = "Guest"
  #   @password = "guest123"
  #   visit root_path
  #   click_link "Sign In"
  #
  #   fill_in "Name", with: @name
  #   fill_in "Password", with: @password
  #
  #   click_link "Sign In"
  # end

  scenario "user fills out bar creation form successfully" do
    visit new_bar_path

    fill_in "Name", with: "Jacob Wirth's"
    fill_in "Address", with: "31 Stewart Street"
    fill_in "City", with: "Boston"
    fill_in "State", with: "Massachusetts"
    fill_in "Zip", with: "02120"

    # expect(page).to have_content("Sign Out")

    click_button "Create Bar"

    expect(page).to have_content("Jacob Wirth's")
    expect(page).to have_content("31 Stewart Street")
    expect(page).to have_content("Boston")
    expect(page).to have_content("Massachusetts")
    expect(page).to have_content("02120")
  end

  scenario "user fills out bar creation form unsuccessfully" do
    visit new_bar_path

    fill_in "Name", with: ""
    fill_in "Address", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    fill_in "Zip", with: ""

    click_button "Create Bar"

    expect(page).to have_content("Name can't be blank, Address can't be blank, State can't be blank, City can't be blank, Zip can't be blank, Zip is not a number, Zip is the wrong length (should be 5 characters)")
  end
end
