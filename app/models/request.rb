# == Schema Information
#
# Table name: requests
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  email        :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Request < ApplicationRecord
  belongs_to :user
  has_many :talent_requests, dependent: :destroy
  accepts_nested_attributes_for :talent_requests
  after_create :notifier

  def notifier
    SendMailToAdminForATalentRequestJob.perform_later(id)
    SendAdmittedMsgForTalentRequestJob.perform_later(id)
  end
end
