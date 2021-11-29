class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def check_user
    if current_user != User.find(params[:id])
      redirect_to root_path
    end
  end
end
