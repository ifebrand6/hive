class ApplicationMailer < ActionMailer::Base
  default from: 'ifebrand6@gmail.com'
  layout 'mailer'
  add_template_helper(MailerHelper)
end
