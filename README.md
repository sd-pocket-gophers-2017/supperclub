# README

TEAM NAME: PINEAPPLES

MEMBERS:  Alexis Deruyter
          Mark Kim
          Emmet Mahdavi

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
