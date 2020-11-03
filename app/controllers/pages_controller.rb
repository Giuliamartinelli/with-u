require 'twilio_methods'

class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def incoming
  end

  def profile
    @user = current_user
    @angels = Angel.where(user_id: current_user.id) # [angel.first, ...]
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
  end
end
