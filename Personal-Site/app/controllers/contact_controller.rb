class ContactController < ApplicationController
  def send_mail
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      UserMailer.contact_email(name, email, subject, message).deliver
      UserMailer.confirm_email(name, email, subject, message).deliver

      redirect_to root_url, notice: 'Message sent'
  end

end
