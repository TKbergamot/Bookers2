class UsersController < ApplicationController

before_action :authenticate_user!
before_action :current_user, only: [:edit,:update]

  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        redirect_to user_path, notice: "You have updated user successfully."
      else
        render :edit
      end
    else redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end
end
