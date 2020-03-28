class ExpertApplication < ApplicationRecord
    belongs_to :talent_type

    def onboarding_expert(expert_application)
        if (expert_application.status === false)
            self.status = true
        else
            return expert_application
        end
    end
end
