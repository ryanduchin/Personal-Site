class ContactController < ApplicationController
  def send_mail
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      if valid_email(email)
        UserMailer.contact_email(name, email, subject, message).deliver
        UserMailer.confirm_email(name, email, subject, message).deliver
        # flash.now.notice = "Message Sent!"
        redirect_to root_url, notice: "Message Sent!"
      else
        # flash.now.alert = "Error: Invalid email!"
        flash.keep
        redirect_to root_url(anchor: 'contact'), notice: "Error invalid email"
      end
  end

  private

  def valid_email(email)
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ email) != nil
  end

end
