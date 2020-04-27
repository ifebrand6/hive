# == Schema Information
#
# Table name: experts
#
#  id              :bigint           not null, primary key
#  first_name      :string(30)
#  last_name       :string(30)
#  email           :string
#  phone_number    :integer
#  contact_address :text
#  short_bio       :text
#  certification   :text             default([]), is an Array
#  status          :boolean          default(FALSE)
#  suggested_skill :string(50)
#  talent_type_id  :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Expert < ApplicationRecord
    belongs_to :talent_type
    after_create :notifier

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def onboarding_expert
        if (self.status === false)
            self.update(status: true)
            SendAcknowledgeMailToNewExpertJob.perform_later(id)
        else
            return self
        end
    end

    private
    def notifier
        SendMailToAdminForNewExpertAppplicationJob.perform_later(id)
        SendAcknowledgeMailToNewExpertJob.perform_later(id)
    end
end
