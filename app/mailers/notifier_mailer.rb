class NotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_accepted_expert_mail.subject
  #
  def send_accepted_expert_mail
    @expert = params[:expert]
    mail(to: @expert.email, subject: 'Your application has been approved' )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_mail_to_admin_for_a_talent_request.subject
  #
  def send_mail_to_admin_for_a_talent_request
    @request = params[:request]
    @talent_request = @request.talent_request
    mail(to: ADMIN_EMAIL, subject: "You have a new Request.")
  end
  
  def send_admitted_msg_for_talent_request
    @request = params[:request]
    @talent_request = @request.talent_request
    mail(to: @request.email, subject: "Your Request has been recieved.")
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_final_request_mail.subject
  #
  def send_final_request_mail
    @finalized_request = params[:finalized_request]
    @email = @finalized_request.request.email
    @user = @finalized_request.user
    mail(to: @email, subject: 'Your Request has been Processeed' )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.send_mail_for_a_completed_transcation.subject
  #
  def send_mail_for_a_completed_transcation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
