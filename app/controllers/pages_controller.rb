require 'twilio_methods'

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def welcome
  end

  def incoming
  end

  def profile
    @user = current_user
    @angels = Angel.where(user_id: current_user.id) # [angel.first, ...]
    @angel = Angel.new
  end

  def create
    @angel = Angel.new(params_allowed)
    @angel.user_id = current_user.id
    if @angel.save
      redirect_to profile_path
    else
      render 'profile'
    end
  end

  def call_angels
    @user = current_user
    @angels_numbers = Angel.select(:phone_number).where(user_id: current_user.id) # [angel.phone_number, ..]
    TwilioMethods.call_angels(@angels_numbers, @user)
    # add routes
    # method call angels

    # respond_to do |format|
    #   format.js { render template: 'call_angels.js.erb' }       #respond to the js call (remote:true) with some js

    # # path template is a js.erb file that changes something that we need changed
    # end
  end

  def tutorial
  end

  def fakecall
  end

  def map
    @locations = Map.all
    @markers = @locations.map do |location|
      { lat: location.lat.to_f, lng: location.long.to_f }
    end
  end

  private

  def params_allowed
    params.require(:angel).permit(:name, :phone_number, :user_id)
  end
end
