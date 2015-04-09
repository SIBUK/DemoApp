class ContactMailer < ActionMailer::Base
  default from: "contact@mydemoblog.com"

  def contact_email(form_info)
    @name = form_info[:name]
    @message = form_info[:message]
    @from = form_info[:email]
    @subject = form_info[:subject]
    mail(to: 'simon.bailey@mobica.com', from: @from, subject: @subject)
  end
end
