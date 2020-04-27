class SendMailForACompletedTranscationJob < ApplicationJob
  queue_as :default

  def perform(transaction_id)
    @transaction = Transaction.find(transaction_id)
    NotifierMailer.with(transaction: @transaction).send_mail_for_a_completed_transcation.deliver_now
  end
end
