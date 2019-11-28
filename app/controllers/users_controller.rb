class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_user, only: [:show, :edit, :update, :requests]

  def index
    if params[:search].present?
      @users = policy_scope(User).where(["actor = ?", true]).global_search(params[:search][:query]).order(created_at: :desc)
    else
      @users = policy_scope(User).where(["actor = ?", true]).order(created_at: :desc)
    end
  end

  def show
    @transactions = Transaction.joins(:trademark).where("trademarks.user_id = ?", @user.id)
        raise
    @markers = convert_markers(@transactions)
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


  def convert_markers(things)
      things.map do |transaction|
      {
        lat: transaction.latitude,
        lng: transaction.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { transaction: transaction }),
        description: transaction.description,
        date: transaction.date,
        location: transaction.location,
        trademark_id: transaction.trademark_id,
        user_id: transaction.user_id,
        existing: transaction.existing,
        optional_title: transaction.optional_title,
        price_per_hour: transaction.price_per_hour,
        id: transaction.id
      }
    end
  end


  def requests
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
