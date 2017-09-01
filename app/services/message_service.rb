class Messenger
  def send_messages(event)
    boot_twilio
    @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: invite.guest.phone,
        body: "You're invited!  #{invite.event.location} at #{invite.event.date_time.strftime('%b %-d, %Y %-l:%M %P')}, please respond 'rsvp' to accept or 'no' to decline.\n Full Details:\n http://clubpineapple.herokuapp.com/#{@event.token}"
        )
    end
  end

  def reply(from_number, message_body)
    guest = Guest.find_by(phone: from_number)
    invite = guest.invites.order(:created_at).last
    case message_body.downcase
    when 'rsvp'
      response = 'Thank you for RSVPing'
      invite.update(accepted: 'Accepted')
    when 'no'
      response = 'Maybe next time'
      invite.update(accepted: 'Declined')
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

  def follow_up
    boot_twilio
    Invites.open.in_two_days.each do |invite|
      host_name = invite.admin.full_name
      @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: invite.guest.phone,
        body: "Only 2 days until #{invite.event.title}! Please let #{host_name} know if you can come. Respond 'rsvp' to accept or 'no' to decline.\n Full Details:\n http://clubpineapple.herokuapp.com/#{invite.event.token}"
        )
    end
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
