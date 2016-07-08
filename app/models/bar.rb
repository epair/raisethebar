class Bar < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5 }
  validates :photo_url, presence: true
end
