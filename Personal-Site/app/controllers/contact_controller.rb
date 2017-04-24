class ContactController < ApplicationController
  def send_mail
    @name = params[:contact_name]
    @hidden_blank_field = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]
    if should_send_email?
      UserMailer.message_confirmation_email(@name, @email, @subject, @message).deliver
      UserMailer.admin_contact_email(@name, @email, @subject, @message).deliver
    end
    set_flash_message
    render "static_pages/index"
  end

  private

  def should_send_email?
    valid_email_address? && email_parameters_are_present? && is_not_spam_bot?
  end

  def should_appear_to_send_email?
    valid_email_address?
  end

  def valid_email_address?
    (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ =~ @email) != nil
  end

  def email_parameters_are_present?
    [@name, @email, @message].map(&:present?).all?
  end

  def is_not_spam_bot?
    @hidden_blank_field.blank?
  end

  def set_flash_message
    if should_appear_to_send_email?
      flash.notice = "Thank you for your message!"
    else
      flash.alert = "Sorry, there was an error with your email address."
    end
  end
end
