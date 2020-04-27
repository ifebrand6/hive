class NotifierMailer < ApplicationMailer

  def send_accepted_expert_mail
    @expert = params[:expert]
    mail(to: @expert.email, subject: 'Your application has been approved' )
  end

  def send_mail_to_admin_for_new_expert_appplication
    @expert = params[:expert]
    mail(to: ADMIN_EMAIL, subject: "You have new expert application")
  end

  def send_acknowledge_mail_to_new_expert
    @expert = params[:expert]
    mail(to: @expert.email, subject: "Your application has been recieved")
  end

  def send_mail_to_expert_for_an_assigned_talent
      @finalized_request = params[:finalized_request]
      @talent_assignment = @finalized_request.talent_assignment
      @email = @finalized_request.talent_assignment.expert.email
      mail(to: @email, subject: "You have a new job")
  end

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
  
  def send_final_request_mail
    @finalized_request = params[:finalized_request]
    @email = @finalized_request.request.email
    @user = @finalized_request.user
    mail(to: @email, subject: 'Your Request has been Processeed' )
  end

  def send_mail_for_a_completed_transcation
    @transaction = params[:transaction]
    @transaction_reference = generate_unique_reference(@transaction)
    @email = @transaction.finalized_request.request.email
    mail(to: @email, subject: 'Your Transaction is successful!' )
  end

  private
    def generate_unique_reference(transaction)
      a = transaction
      c = "REF/#{a.id}/"
      b = (a.created_at).strftime("%Y%m%dT%H%M")
      reference = c << b
      return reference
    end
end
