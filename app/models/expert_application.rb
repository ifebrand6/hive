class ExpertApplication < ApplicationRecord
    belongs_to :talent_type
    has_dynabutes

    scope :pending_application, lambda { where(:status => false)}
    scope :onboard_expert, -> { where(:status => true)}

    def accept_application
        if (self.status === false)
            self.update(status: true)
            SendAcceptedExpertMailJob.perform_later(self.id)
        end
    end
end