class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def create
    @user = current_user
    @angels = Angel.where(user_id: @user.id) # [angel.phone_number, ..]
    @latitude = params[:lat]
    @longitude = params[:long]
    TwilioMethods.send_location(@angels, @latitude, @longitude, @user)
    #can be done via service worker
    @map = Map.new(params_allowed)
    @map.user_id = @user.id
    @map.save
  end

  private

  def params_allowed
    params.permit(:lat, :long, :user_id)
  end
end
