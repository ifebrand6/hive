# == Schema Information
#
# Table name: talent_assignments
#
#  id                   :bigint           not null, primary key
#  engaged_date         :date
#  start_date           :date
#  end_date             :date
#  finalized_request_id :bigint
#  expert_id            :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class TalentAssignment < ApplicationRecord
  belongs_to :finalized_request
  belongs_to :expert

  monetize :contract_cost, as: "amount"

end
