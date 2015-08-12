class ContactController < ApplicationController
  def send_mail
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      if valid_email(email)
        p 'hey'
        UserMailer.contact_email(name, email, subject, message).deliver
        UserMailer.confirm_email(name, email, subject, message).deliver
        flash.now.notice = "Message Sent!"
        redirect_to root_url
      else
        flash.now.alert = "Error: Invalid email!"
        redirect_to root_url(anchor: 'contact')
      end
  end

  private

  def valid_email(email)
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ email) != nil
  end

end
