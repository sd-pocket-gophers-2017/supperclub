require 'twilio-ruby'

class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_messages
    @event = Event.find(params[:event_id])
    boot_twilio
    @event.invites.each do |invite|
      @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: invite.guest.phone,
        body: "You're invited!  #{invite.event.location} at #{invite.event.date_time.strftime('%b %-d, %Y %-l:%M %P')}, please respond 'rsvp' to accept or 'no' to decline."
        )
    end
    redirect_to @event
  end

  def reply
    message_body = params['Body']
    from_number = params['From']
    guest = Invite.open.joins(:people).where(phone: 'from_number').first
    case message_body.downcase
    when 'rsvp'
      response = 'Thank you for RSVPing'
      guest.update(accepted: 'true')
    when 'no'
      response = 'Maybe next time'
      guest.update(accepted: 'false')
    else
      response = "I didn't understand.  Please respond 'rsvp' to accept or 'no' to decline."
    end
    boot_twilio
    sms = @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: from_number,
      body: response
      )
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
