require 'twilio-ruby'

module TwilioMethods

  Whatsapp_api = "+14155238886"
  Call_api = "+12058968802"
  Account_sid = ENV[Account_sid_secret]
  Auth_token = ENV[Auth_token_secret]

  def self.call_angels(angels_numbers)
    response = Twilio::TwiML::VoiceResponse.new
    response.say(message: "Incoming call from #{current_user.name}, please hold on")
    response.dial(number: current_user.phone_number)
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    angels_numbers.each do |angel|
      call = @client.calls.create(twiml: response, to: angel, from: Call_api)
    end
  end

  def self.send_location(angels_numbers, latitude, longitude)
    text_body = "Hello there, #{current_user.name} sent to you her location because she doesn't feel safe. Make sure to check in on her."
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    angels_numbers.each do |angel|
      message = @client.messages.create(body: text_body, from: "whatsapp:#{Whatsapp_api}",
                persistent_action: ["geo:#{latitude},#{longitude}"], to: "whatsapp:#{angel}")
    end
  end
end
