class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all #where(["actor = ?", true]) # filter searches for actor here?
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @restaurant = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
