class ExpertApplication < ApplicationRecord
    belongs_to :talent_type

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def onboarding_expert
        if (self.status === false)
            self.update(status: true)
            #send mail to self email notifying expert of accepted application
        else
            return expert_application
        end
    end
end
