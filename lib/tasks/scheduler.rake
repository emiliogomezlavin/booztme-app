desc "This task is called by the Heroku scheduler add-on"

task :set_daily_times => :environment do
  puts "Updating feed..."
  User.setRandomTime
  puts "done."
end

task :send_boozts => :environment do
  puts "Updating feed..."
  User.send_boozts
  puts "done."
end


