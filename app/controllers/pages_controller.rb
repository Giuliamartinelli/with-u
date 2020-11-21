require 'twilio_methods'

class PagesController < ApplicationController

  def welcome
  end

  def incoming
  end

  def profile
    @user = current_user
    @angels = Angel.where(user_id: current_user.id)
    @angel = Angel.new
  end

  def code
    @user = current_user
    Code = @user.code[:code]
    #send verification code to user
  end

  def verify
    @user = current_user
    verified = @user.verify(params["/profile"]["code"])
    p params["/profile"]["code"]
  end

  def create
    @user = current_user
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
    @angels_numbers = Angel.select(:phone_number).where(user_id: current_user.id)
    TwilioMethods.call_angels(@angels_numbers, @user)
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
