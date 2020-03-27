class TalentType < ApplicationRecord
    has_many :expert_applications
    accepts_nested_attributes_for :expert_applications, reject_if: :reject_expert_application

    def reject_expert_application(attributes)
        attributes['expert_specialization'].blank? #|| attributes['expert_specialization'].exists?
    end
end
