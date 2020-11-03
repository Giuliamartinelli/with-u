require 'twilio_methods'

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def incoming
    # method to get the latitude
    @latitude = get_location[:lat]
    @latitude = get_location[:long]
    @angels_numbers = Angel.select(:phone_number).where(user_id: current_user.id) # [angel.phone_number, ..]
    TwilioMethods.send_location(@angels_numbers, @latitude, @longitude)
  end

  def profile
    @user = current_user
    @angels = Angel.where(user_id: current_user.id) # [angel.first, ...]
  end

  def tutorial

  end

  def fakecall
    @latitude = get_location[:lat]
    @latitude = get_location[:long]
    @angels_numbers = Angel.select(:phone_number).where(user_id: current_user.id) # [angel.phone_number, ..]
    TwilioMethods.call_angels(@angels_numbers)
    TwilioMethods.send_location(@angels_numbers, @latitude, @longitude)
  end

  def map
    @locations = Map.all
  end

end
