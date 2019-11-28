class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:edit, :update]

  def new
    @user = User.find(params[:user_id])
    @transaction = Transaction.new
    @trademark_array = create_array(@user.trademarks)
    authorize @user
  end

  def create
    @user = User.find(params[:user_id])
    @transaction = Transaction.new(transaction_params)
    if params[:transaction][:optional_title].present?
      @transaction.trademark_id = @user.trademarks.first.id
      @transaction.existing = false
    end
    @transaction.user_id = current_user.id
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

  def create_array(services)
    array = []
    services.each do |service|
      array << ["#{service.skill} - #{service.price_per_hour} $/h", service.id]
    end
    array << ["New service", "new-service"]
    return array
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :location, :date, :description, :trademark_id, :optional_title, :price_per_hour)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
