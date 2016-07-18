class ApplicationMailer < ActionMailer::Base
  default from: "emiliogomezlavin@gmail.com"
  layout 'mailer'

    def boozt_email(user)
    @user = user
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "It's Boozt Time!!!")
  end
end
