class Expert < ApplicationRecord
    belongs_to :talent_type

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def onboarding_expert
        if (self.status === false)
            self.update(status: true)
            SendAcceptedExpertMailJob.perform_later(self.id)
        else
            return self
        end
    end
end
