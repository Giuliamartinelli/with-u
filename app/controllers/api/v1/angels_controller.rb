class Api::V1::AngelsController < ApplicationController

  def create
    @angel = Angel.create(angels_params)
    render json: @angel
  end

  def update
    @angel = Angel.find(params[:id])
    @angel = Angel.update(angels_params)
    render json: @angel
  end

  def destroy
    @angel = Angel.find(params[:id])
    @angel.destroy
  end

  def index
    @angels = Angel.where(user_id: current_user)
    render json: @angels
  end

  private

  def angels_params
    params.require(:angel).permit(:name, :phone_number, :user_id, :prefix)
  end
end
