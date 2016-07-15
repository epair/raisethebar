class Review < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user
  has_many :votes

  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }, length: { is: 1 }
  validates :price, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }, length: { is: 1 }
  validates :title, presence: true
  validates :user_id, presence: true
  validates :bar_id, presence: true
  validates :vote_count, presence: true

  def vote_counter(votes)
    upvotes = []
    downvotes = []
    votes.each do |vote|
      if vote.upvote
        upvotes << vote
      else
        downvotes << vote
      end
    end
    upvotes.length - downvotes.length
  end
end
