class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User).order(created_at: :desc).where(["actor = ?", true])
  end

  def show
    @transactions = Transaction.joins(:trademark).where("trademarks.user_id = ?", @user.id)
    @markers = @transactions.map do |transaction|
      {
        lat: transaction.latitude,
        lng: transaction.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { transaction: transaction })
      }
    end
    authorize @user
  end

  # will not need it because it is all handled in devise edit
  # def edit
  #   authorize @user
  # end

  def update
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :photo)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
