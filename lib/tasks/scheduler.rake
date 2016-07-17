desc "This task is called by the Heroku scheduler add-on"

task :prueba => :environment do
  puts "Updating feed..."
  User.prueba
  puts "done."
end

