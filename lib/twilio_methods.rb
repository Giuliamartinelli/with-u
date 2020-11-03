require 'twilio-ruby'

module TwilioMethods

  Whatsapp_api = "+14155238886"
  Call_api = "+12058968802"
  Account_sid = ENV['ACCOUNT_SID_SECRET']
  Auth_token = ENV['AUTH_TOKEN_SECRET']

  def self.call_angels(angels_numbers, user)
    response = Twilio::TwiML::VoiceResponse.new
    response.say(message: "Incoming call from #{user.name}, please hold on")
    response.dial(number: user.phone_number)
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    angels_numbers.each do |angel|
      call = @client.calls.create(twiml: response, to: angel.phone_number, from: Call_api)
    end
  end

  def self.send_location(angels_numbers, latitude, longitude, user)
    text_body = "Hello there, #{user.name} sent to you her location because she doesn't feel safe. Make sure to check in on her."
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    angels_numbers.each do |number|
      message = @client.messages.create(body: text_body, from: "whatsapp:#{Whatsapp_api}",
                persistent_action: ["geo:#{latitude},#{longitude}"], to: "whatsapp:#{number.phone_number}")
    end
  end
end
