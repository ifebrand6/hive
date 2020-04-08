# == Schema Information
#
# Table name: talent_types
#
#  id                    :bigint           not null, primary key
#  expert_specialization :string(50)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class TalentType < ApplicationRecord
    has_many :expert_applications
    accepts_nested_attributes_for :expert_applications, reject_if: :reject_expert_application

    def reject_expert_application(attributes)
        attributes['expert_specialization'].blank? #|| attributes['expert_specialization'].exists?
    end
end
