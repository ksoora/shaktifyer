class NotificationController < ApplicationController

    skip_before_action :verify_authenticity_token

    def notify
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

      puts "Rails.application.secrets.twilio_account_sid: #{Rails.application.secrets.twilio_account_sid}"
      message = client.messages.create from: '15014082532', to: '17133200303', body: 'Karthik is testing his text messaging app'
      puts message.status
      render plain: message.status
    end

end
