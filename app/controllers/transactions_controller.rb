class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:edit, :update]

  def new
    @user = User.find(params[:user_id])
    @transaction = Transaction.new
    authorize @user
  end

  def create
    @user = User.find(params[:user_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.trademark_id = @user.trademarks.first.id

    if @transaction.save
      redirect_to user_show_path(@user)
    else
      render :new
    end
    authorize @user
  end

  def edit
  end

  def update
    @transaction.update(transaction_params)
    redirect_to user_path(@user)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :location, :date, :description, :user_id, :trademark_id)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
