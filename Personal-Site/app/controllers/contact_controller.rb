class ContactController < ApplicationController
  def send_mail
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      if valid_email(email)
        UserMailer.contact_email(name, email, subject, message).deliver
        UserMailer.confirm_email(name, email, subject, message).deliver
        flash.alert = "Message Sent!"
        render "static_pages/index"
      else
        flash.alert = "Error: Invalid email!"
        render "static_pages/index"
      end
  end

  private

  def valid_email(email)
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ email) != nil
  end

end
