require 'twilio-ruby'
require 'open-uri'

Account_sid = 'AC3cf3c63b1da96cb255febfa6aad0e4a4'
Auth_token = 'debf482f741d3f8560cd725d87bd58bd'
GIULIA = {name:"Giulia Martinelli", phone_number:"+393450847902"}
Angels_numbers = ['+4366488623868', '+4591485113'] #fetched with a SQL query
Whatsapp_api = "+14155238886"
Call_api = '+12058968802'
Text_body = "Hello there, #{GIULIA[:name]} sent to you her location because she doesn't feel safe. Make sure to check in on her."
Latitude = "45.4669697"
Longitude = "9.1962298"

def call_angels
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

call_angels

send_location

