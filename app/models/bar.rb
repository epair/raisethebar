class Bar < ActiveRecord::Base
  has_many :reviews
  
  validates :name, presence: true
  validates :address, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5}

end
