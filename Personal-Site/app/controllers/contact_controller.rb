class ContactController < ApplicationController
  def send_mail
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    message = params[:message]
    if valid_email_address?(email)
      UserMailer.confirm_email(name, email, subject, message).deliver
      if email_parameters_are_present?(name, email, subject, message) #stricter logic to reduce spam
        UserMailer.contact_email(name, email, subject, message).deliver
      end
    end
    flash.notice = "Thank you for your message!"
    render "static_pages/index"
  end

  private

  def valid_email_address?(email)
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ email) != nil
  end

  def email_parameters_are_present?(name, email, subject, message)
    [name, email, subject, message].map(&:present?).all?
  end
end
