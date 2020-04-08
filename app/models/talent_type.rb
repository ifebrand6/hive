# == Schema Information
#
# Table name: talent_types
#
#  id                    :bigint           not null, primary key
#  expert_specialization :string(50)
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class TalentType < ApplicationRecord
    has_many :experts
    accepts_nested_attributes_for :experts, reject_if: :reject_expert

    def reject_expert(attributes)
        attributes['expert_specialization'].blank? #|| attributes['expert_specialization'].exists?
    end
end
