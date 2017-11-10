# Text Event Application

## Description
A rails app made to text invitations, reminders, receive confirmations, and text location and directions automatically once an event is created. Built with :heart: in collaboration with [AlexisDeTRuyter](https://github.com/AlexisTDeRuyter) and [EmmetMahdavi](https://github.com/emmetreza).

### Details
* Makes heavy use of slim templating, jQuery AJAX, and Materialize.
* ___Ruby Version___: 2.3.4
* ___Rails Version___: 5.1.3
* ___Database___: PostgreSQL 0.18
* ___Dependencies___: Puma 3.7, Devise, Twilio API, Google Maps API, Materialize CDN, JQuery CDN


## Features

### Create Event
> Users can create and event using a guest list that can be editted.  The event must have a location, time, and description. 

### Text Alert
> Utilizing the Twilio App, guests are alerted to the event invitation and are able to SMS invite confirmations directly to the app.  If the guest hasn't responded within two days of the event, an SMS reminder is sent.

### Event Coordination
> The event creator has access to the RSVP list and is also capable to remove people from the guest list that sends a notification to the guest of a cancelled invitation 


