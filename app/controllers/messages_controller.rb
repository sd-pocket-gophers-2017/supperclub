require 'twilio-ruby'

class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_messages
    @event = Event.find(params[:event_id])
    Messenger.send_messages(@event)
    redirect_to @event
  end

  def reply
    Messenger.reply(params['From'], params['Body'])
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
