# require "rails_helper"
#
# feature "user views reviews" do
#   let!(:user) { FactoryGirl.create(:user) }
#   let!(:bar) { FactoryGirl.create(:bar, user_id: user.id) }
#   let!(:review1) { FactoryGirl.create(:review, bar_id: bar.id, user_id: user.id) }
#
#   scenario "user votes up on a bar review" do
#     login_user(user)
#     click_link bar.name
