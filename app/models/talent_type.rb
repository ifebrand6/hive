class TalentType < ApplicationRecord
    has_many :experts
    accepts_nested_attributes_for :experts, reject_if: :reject_expert

    def reject_expert(attributes)
        attributes['expert_specialization'].blank? #|| attributes['expert_specialization'].exists?
    end
end
