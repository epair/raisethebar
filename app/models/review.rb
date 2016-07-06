class Review < ActiveRecord::Base
  belongs_to :bar

  validates :body, presence: true
  validates :rating, presence: true
  validates :price, presence: true
end
