class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def create
    @user = current_user
    @angels_numbers = Angel.where(user_id: @user.id) # [angel.phone_number, ..]
    TwilioMethods.send_location_sms(@angels_numbers, params[:lat], params[:long], @user)
    @map = Map.new(params_allowed)
    @map.user_id = @user.id
    @map.save
  end

  private

  def params_allowed
    params.permit(:lat, :long, :user_id)
  end
end
