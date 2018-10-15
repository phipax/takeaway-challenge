require 'twilio-ruby'

class Sms
  attr_reader :to, :tw
  def initialize(tw = Twilio::REST::Client)
    @account_sid = ENV['TWILIOACCOUNT_SID']
    @auth_token = ENV['TWILIOACCOUNT_KEY']
    @from = ENV['TWILIOACCOUNT_NUM']
    @tw = tw.new @account_sid, @auth_token
    @to = ENV['MYNUMBER']
  end

  def send
    time = Time.new
    #@client = Twilio::REST::Client.new @account_sid, @auth_token
    @tw.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}",
    to: @to,    # Replace with your phone number
    from: @from)  # Replace with your Twilio number
    #puts message.sid
    "Complete"
  end
end
