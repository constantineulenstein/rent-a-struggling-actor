class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:edit, :update, :destroy]

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
    @user = User.find(params[:user_id])
    @transaction = Transaction.find(params[:id])
    @trademark_array = create_array(@user.trademarks)
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    @transaction.update(transaction_update_params(current_user.id))
    if @transaction[:trademark_id] == 0
      @transaction[:trademark_id] = @user.trademarks.first.id
      @transaction.existing = false
    end
    @transaction.save
    redirect_to user_show_path(@user)
    authorize @user
    # Trademark id is not passed, therefore rollnack thorugh validation
  end

  def destroy
    @user = User.find(params[:user_id])
    @transaction.destroy
    redirect_to user_show_path(@user)
    authorize @user
  end

  def create_array(services)
    array = []
    services.each do |service|
      array << ["#{service.skill} - #{service.price_per_hour} $/h", service.id]
    end
    array << ["New service", "new-service"]
    return array
  end

  def approve
    @transaction_id = params[:id]
    @transaction = Transaction.find(@transaction_id)
    @transaction.approved = true
    @transaction.save
    @user = User.find(@transaction.user_id)
    authorize @user
    redirect_to user_requests_path(current_user)
  end

  def reject
    @transaction_id = params[:id]
    @transaction = Transaction.find(@transaction_id)
    @transaction.approved = false
    @transaction.save
    @user = User.find(@transaction.user_id)
    authorize @user
    redirect_to user_requests_path(current_user)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :location, :date, :description, :trademark_id, :optional_title, :price_per_hour)
  end

  def transaction_update_params(trans)
    data = params.require(:transaction).permit(:location, :date, :description, :trademark_id, :optional_title, :price_per_hour)
    data[:user_id] = trans
    # data[:trademark_id] =
    return data
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
