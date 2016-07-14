class AdminsController < ApplicationController


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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_path
  end
end
