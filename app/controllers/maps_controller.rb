class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def create
    binding.pry
    # @map = Map.new(params_allowed)
    @map.user_id = current_user.id
  end

  private

  # def params_allowed
  #   params.permit(:lat, :long, :user_id)
  # end
end
