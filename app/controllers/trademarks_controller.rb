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
  end

  def update
    @trademark.update(trademark_params)
    redirect_to user_path(@user)
  end

  private

  def trademark_params
    params.require(:trademark).permit(:skill, :user_id)
  end
end
