# == Schema Information
#
# Table name: transactions
#
#  id                   :bigint           not null, primary key
#  amount               :integer
#  user_id              :bigint
#  finalized_request_id :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :finalized_request
  monetize :amount, as: "amount_price"
  after_create :notifier
  
  def notifier
    SendMailForACompletedTranscationJob.perform_later(id)
  end
end
