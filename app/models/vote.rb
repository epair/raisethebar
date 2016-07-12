class Vote < ActiveRecord::Base
  belongs_to :review
  has_one :upvote
  has_one :downvote
  validates :only_one_vote
end
