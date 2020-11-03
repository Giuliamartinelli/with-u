class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def create
    # TwilioMethods.send_location(angels_numbers, params[:lat], params[:long])
    @map = Map.new(params_allowed)
    @map.user_id = current_user.id
    @map.save
  end

  private

  def params_allowed
    params.permit(:lat, :long, :user_id)
  end
end
