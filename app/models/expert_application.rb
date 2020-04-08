# == Schema Information
#
# Table name: expert_applications
#
#  id              :bigint           not null, primary key
#  firstName       :string(30)
#  lastName        :string(30)
#  email           :string
#  phoneNumber     :integer
#  contactAddress  :text
#  shortBio        :text
#  certification   :text             default([]), is an Array
#  status          :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  talent_type_id  :bigint
#  suggested_skill :string(50)
#
class ExpertApplication < ApplicationRecord
    belongs_to :talent_type

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def onboarding_expert
        if (self.status === false)
            self.update(status: true)
        else
            return expert_application
        end
    end
end
