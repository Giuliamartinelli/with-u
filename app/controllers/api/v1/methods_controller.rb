require 'twilio_methods'

class Api::V1::MethodsController < ApplicationController
  before_action :set_user

  def create_location
    @map = Map.create(map_params)
    render json: @map
  end

  def call_angels
    @angels = Angels.where(user_id: @user)
    @call_sids = TwilioMethods.call_angels(@angels, @user)
    render json: @call_sids
  end

  def send_location_sms
    @angels = Angels.where(user_id: @user)
    @message_sids = TwilioMethods.send_location_sms(@angels, params[:lat], params[:long], @user)
    render json: @message_sids
  end

  def send_verification
    @verification_status = TwilioMethods.send_verification_code(@user.full_number)
    render json: @verification_status
  end

  def verify_phone_number
    if TwilioMethods.verify_number(@user.full_number, params[:code])
      render json: true
    else
      render json: false
    end
  end

  private

  def set_user
    @user = current_user
  end

  def map_params
    params.require(:map).permit(:lat, :long, :user_id)
  end
end
