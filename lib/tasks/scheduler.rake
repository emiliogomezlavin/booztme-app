desc "This task is called by the Heroku scheduler add-on"

task :boozt_email => :environment do
  puts "Updating feed..."
  User.boozt_email
  puts "done."
end

task :boozt_text_message => :environment do
  puts "Updating feed..."
  User.send_sms
  puts "done."
end


