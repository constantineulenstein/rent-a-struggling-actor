class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:edit, :update]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
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
