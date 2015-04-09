class ContactMailer < ActionMailer::Base
  default from: "mydemoapp-env.elasticbeanstalk.com"

  def contact_email(form_info)
    @name = form_info[:name]
    @message = form_info[:message]
    @from = form_info[:email]
    @subject = form_info[:subject]
    mail(to: ENV['CONTACT_EMAIL'], from: @from, subject: @subject)
  end
end
