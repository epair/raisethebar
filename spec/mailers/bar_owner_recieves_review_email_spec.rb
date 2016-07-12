scenario "review a product" do
  let!(:bar) { FactoryGirl.create(:bar, user_id: user.id) }
  let!(:user) { FactoryGirl.create(:user) }

   login_user(user)
   click_link bar.name

   fill_in "Review Body", with: "ITS SO AWESOME!"
   fill_in "Title", with: "Title of our review"
   choose 'review_rating_1'
   choose 'review_price_3'

   click_button "Create Review"


   expect(page).to have_content("ITS SO AWESOME!")
  #  expect(ActionMailer::Base.deliveries.count).to eq(1)

   email = ActionMailer::Base.deliveries.last
  expect(email.to.first).to eq("drizzle@launchacademy.com")
  expect(email.subject).to eq("Home page visited")
  expect(email.body.to_s).to include("Hey somebody visited my home page")

 end
