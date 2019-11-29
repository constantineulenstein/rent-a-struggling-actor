class TrademarksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @trademark = Trademark.new
    authorize @user
  end

  def create
    @user = User.find(params[:user_id])
    @trademark = Trademark.new(trademark_params)
    @trademark.user_id = @user.id

    if @trademark.save
      redirect_to user_show_path(@user)
    else
      render :new
    end
    authorize @user
  end

  def edit
    @user = User.find(params[:user_id])
    @trademark = Trademark.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    @trademark = Trademark.find(params[:id])
    @trademark.update(trademark_update_params(current_user.id))
    redirect_to user_show_path(@user)
    authorize @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @trademark = Trademark.find(params[:id])
    @trademark.destroy
    authorize @user
    redirect_to user_show_path(@user)
  end

  private

  def trademark_update_params(trans)
    data = params.require(:trademark).permit(:skill, :price_per_hour)
    data[:user_id] = trans
    return data
  end

  def trademark_params
    params.require(:trademark).permit(:skill, :user_id)
  end
end
