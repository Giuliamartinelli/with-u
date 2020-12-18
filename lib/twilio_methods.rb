require 'twilio-ruby'

module TwilioMethods

  Whatsapp_api = "+14155238886"
  Call_api = "+12058968810"
  Account_sid = ENV['ACCOUNT_SID_SECRET']
  Auth_token = ENV['AUTH_TOKEN_SECRET']

  def self.call_angels(angels_numbers, user)
    response = Twilio::TwiML::VoiceResponse.new
    response.say(message: "Incoming call from #{user.name}, please hold on")
    response.dial(number: user.phone_number)
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    angels_numbers.each do |angel|
      call = @client.calls.create(twiml: response, to: angel.phone_number, from: Call_api, timeout: "17")
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

  def self.send_verification_code(phone_number)
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    verification = @client.verify
                          .services('VAf5530091034b4905bb48e6fe19a2e7c7')
                          .verifications
                          .create(to: phone_number, channel: 'sms')
    puts verification.status
  end

  def self.send_location_sms(phone_number, latitude, longitude, user)
    text_body = "Hi I'm #{user.name} I'm using withU, I'm not safe and i'm here http://maps.google.com/maps?q=loc:#{latitude},#{longitude}"
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    message = @client.messages.create(body: text_body, from: "+12058968810", to: phone_number)
  end


  def self.verify_number(phone_number, code)
    @client = Twilio::REST::Client.new(Account_sid, Auth_token)
    verification_check = @client.verify
                                .services('VAf5530091034b4905bb48e6fe19a2e7c7')
                                .verification_checks
                                .create(to: phone_number, code: code)
    if verification_check.status == 'approved'
      return true
    else
      return false
    end
  end
end

