class ApplicationMailer < ActionMailer::Base
  default to: "ryanduchin@gmail.com"
  layout 'mailer'
end
