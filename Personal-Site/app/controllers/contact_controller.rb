class ContactController < ApplicationController
  def send_mail
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]
    if valid_email_address?
      UserMailer.confirm_email(@name, @email, @subject, @message).deliver
      if email_parameters_are_present? #stricter logic to reduce spam
        UserMailer.contact_email(@name, @email, @subject, @message).deliver
      end
      flash.notice = "Thank you for your message!"
    else
      flash.alert = "Error: invalid email"
    end
    render "static_pages/index"
  end

  private

  def valid_email_address?
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ @email) != nil
  end

  def email_parameters_are_present?
    [@name, @email, @subject, @message].map(&:present?).all?
  end
end
