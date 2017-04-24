class UserMailer < ApplicationMailer
  def admin_contact_email(name, email, subject, message)
      @name = name
      @email = email
      @subject = subject
      @message = message
      @email_subject = "Contact via ryanduchin.com from #{@name}"
      mail(to: 'ryanduchin@gmail.com', from: @email, subject: @email_subject)
  end

  def message_confirmation_email(name, email, subject, message)
      @name = name
      @email_subject = 'Contact Confirmation - ryanduchin.com'

      mail(to: email, from: 'ryanduchin@gmail.com', subject: @email_subject)
  end
end
