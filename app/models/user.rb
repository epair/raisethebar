class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :bars
  validates_presence_of :username
  validates :profile_photo, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
end
