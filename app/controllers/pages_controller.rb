class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def incoming

  end

  def profile
    @user = current_user
    @angels = Angel.where("user_id = current_user.id")
  end

  def tutorial

  end

  def fakecall

  end

  def map

  end

  private

  def call_angels()
    response = Twilio::TwiML::VoiceResponse.new
    response.say(message: "Incoming call from #{GIULIA[:name]}, please hold on")
    response.dial(number: '+393450847902')
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    Angels_numbers.each do |angel|
      call = @client.calls.create(twiml: response, to: angel, from: Call_api)
    end
  end

  def send_location
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    Angels_numbers.each do |angel|
      message = @client.messages.create(body: "#{Text_body}", from: "whatsapp:#{Whatsapp_api}",
                persistent_action: ["geo:#{Latitude},#{Longitude}"], to: "whatsapp:#{angel}")
    end
  end
end
