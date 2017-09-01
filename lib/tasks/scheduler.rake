desc "This task is called by the Heroku scheduler add-on"
task :contact_unresponsive_guests => :environment do
  Messenger.follow_up
end
