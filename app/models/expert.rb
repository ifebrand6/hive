# == Schema Information
#
# Table name: experts
#
#  id              :bigint           not null, primary key
#  first_name      :string(30)
#  first_name       :string(30)
#  email           :string
#  phone_nubmer    :integer
#  contact_address :text
#  short_bio       :text
#  certification   :text             default([]), is an Array
#  status          :boolean          default(FALSE)
#  suggested_skill :string(50)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Expert < ApplicationRecord
    belongs_to :talent_type

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def onboarding_expert
        if (self.status === false)
            self.update(status: true)
        else
            return self
        end
    end
end
