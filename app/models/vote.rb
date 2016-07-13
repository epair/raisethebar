class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :upvote, :inclusion => {:in => [true, false]}
end
