class Downvote < ActiveRecord::Base
  belongs_to :vote

  validates :review, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :review }
 end
