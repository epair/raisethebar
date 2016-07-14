class Bar < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  mount_uploader :photo_url, PhotoUrlUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5 }
  validates :photo_url, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }
end
