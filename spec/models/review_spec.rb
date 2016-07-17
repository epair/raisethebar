require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe Review do
  it { should have_valid(:body).when('This place was great') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when(3) }
  it { should_not have_valid(:rating).when(nil, '') }

  it { should have_valid(:price).when(4) }
  it { should_not have_valid(:price).when(nil, '') }

  it { should have_valid(:title).when('OMG') }
  it { should_not have_valid(:title).when(nil, '') }

  describe "#vote_counter" do
    it "returns the vote tally of upvotes - downvotes" do
      review = Review.create(body: "blah", rating: 1, price: 1, title: "blah", user_id: 1, bar_id: 1, vote_count: 2)
      vote1 = Vote.create(user_id: 1, review_id: review.id, upvote: true)
      vote2 = Vote.create(user_id: 1, review_id: review.id, upvote: true)

      vote_array = [vote1, vote2]

      result = review.vote_counter(vote_array)
      expect(result).to eq(2)
    end
  end
end
