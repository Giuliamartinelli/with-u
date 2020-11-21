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

  def code
    @user = current_user
    TwilioMethods.send_verification_code(@user.phone_number)
  end

  def verify
    @user = current_user
    if TwilioMethods.verify_number(@user.phone_number, params['/profile']['code'])
      @user.verification.verified = true
    end
  end

  def call_angels
    @user = current_user
    @angels_numbers = Angel.select(:phone_number).where(user_id: current_user.id) # [angel.phone_number, ..]
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
