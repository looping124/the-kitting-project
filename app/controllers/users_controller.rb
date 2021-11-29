class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    edited_user = params[:user]

    if @user.update(first_name: edited_user[:first_name], last_name: edited_user[:last_name])
      redirect_to user_path(@user)
    else
      render edit_user_path(@user)
    end
  end

  private

  def check_user
    if current_user != User.find(params[:id])
      redirect_to root_path
    end
  end
end
