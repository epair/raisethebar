class UsersController < ApplicationController

  def admin?
    role == "admin"
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    if current_user.admin?
    @user = User.find(params[:id])
    @user.destroy
  end

    if @user.destroy
    redirect_to users_path, notice: "User Deleted"
    end
  end
end
