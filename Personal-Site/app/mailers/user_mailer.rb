class UserMailer < ApplicationMailer
  default to: 'ryanduchin@gmail.com'

  def contact_email(name, email, subject, message)
      @name = name
      @email = email
      @subject = subject
      @message = message

      mail(from: email, subject: 'Ryanduchin.com Contact')
  end

  # def confirm_email(name, email, subject, message)
  #     @name = name
  #     @email = email
  #     @subject = subject
  #     @message = message
  #
  #     mail(from: email, subject: 'Ryanduchin.com Contact')
  # end
  #
end
