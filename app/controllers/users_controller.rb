class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User).order(created_at: :desc).where(["actor = ?", true])
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :photo)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
