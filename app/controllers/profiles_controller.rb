class ProfilesController < ApplicationController
  def show
    @users_bar = current_user.bars
    @users_name = current_user.username
    @users_photo = current_user.profile_photo
  end
end
