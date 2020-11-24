require 'twilio_methods'

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def welcome
  end

  def incoming
    @user = current_user
    @verification = Verification.where(phone_number: @user.full_number)
  end

  def profile
    @user = current_user
    @angels = Angel.where(user_id: @user.id)
    @angel = Angel.new
    @verification = Verification.where(phone_number: @user.full_number)
  end

  def create
    @angel = Angel.new(params_allowed)
    @angel.user_id = current_user.id
    @angel.prefix = (params[:prefix])
    raise
    if @angel.save
      @angel.phone_number.gsub(/\s+/, "")
      redirect_to profile_path
    else
      render 'profile'
    end
  end

  def code
    @user = current_user
    TwilioMethods.send_verification_code(@user.full_number)
  end

  def verify
    @user = current_user
    if TwilioMethods.verify_number(@user.full_number, params['/profile']['code'])
      Verification.create(phone_number: @user.full_number, verified: true, user_id: @user.id )
      redirect_to profile_path
    end
  end

  def call_angels
    @user = current_user
    @verification = Verification.where(phone_number: @user.full_number)
    if @verification.count == 1
      @angels = Angel.where(user_id: current_user.id)
      TwilioMethods.call_angels(@angels, @user)
    end
  end

  def tutorial
  end

  def fakecall
    @user = current_user
    @verification = Verification.where(phone_number: @user.full_number)
  end

  def map
    @locations = Map.all
    @markers = @locations.map do |location|
      { lat: location.lat.to_f, lng: location.long.to_f }
    end
  end

  private

  def params_allowed
    params.require(:angel).permit(:name, :phone_number, :user_id, :prefix)
  end
end
