class Api::V1::VerificationsController < ApplicationController

  def create
    @verification = Verification.create(verification_params)
    render json: @verification
  end

  def index
    @user = current_user
    @verification = Verification.where(phone_number: @user.full_number)
    render json: @verification
  end

  private

  def verification_params
    params.require(:verification).permit(:verified, :phone_number, :user_id)
  end

end
