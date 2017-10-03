# Members  
  Mark Kim  @markjnkim
  Alexis Deruyter @deruyter
  Emmet Mahdavi @emmetreza

# Description
  Client project who requested a web application capable of using SMS to test message potential guests to request confirmation of attendence to a weekly gathering.  The app can also send a reminder prior to the event.  Guests are also able to respond replies via SMS and then store their responses 
  
# Technology
  Ruby on Rails application 
  CSS framework, Materialize
  JQuery and Javascript
  Active Record, Postgresql Database
  Twilio API
  Google Maps API
  Git version control
  Agile Methodology
  
# Features
  Admin user was able to create a customizable guest list
  Guest would be messaged by SMS to confirm attendance to the Admin/host event
  Guest could response by SMS affirmations or denial of attendance
  Guests would be reminded days before the event if a response was still not received
  Guests would receive the address by google map and utilize the navigation service as well 
  
  User Stories:
  - User can create account
  -- or --
  - User can log in

  - User is able to create guests(contacts) consisting of:
    + name
    + email
    + phone

  - User is able to create an event consisting of:
    + title
    + datetime
    + description
    + location

  parentheses means maybe
  (- User can delete or edit event which notifies guests)

  - User can send invites to guests for specific event, thus invite contains:
    + event_id
    + guest_id
    + attribute 'accepted' initialized to null, switched to bool when responded

  (- User can delete invite, which sends text to guest alerting them lol)

  - Guests receive invitations via sms
  - Guests respond to invitations via sms
  - Guests responses are stored in db

  - User can see per event guests classified by rsvp

  - User can log out
