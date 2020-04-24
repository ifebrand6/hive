# == Schema Information
#
# Table name: talent_requests
#
#  id                         :bigint           not null, primary key
#  unit_price                 :integer
#  expected_contract_duration :integer
#  expected_start_date        :date
#  quantity                   :integer          default(1)
#  email                      :string
#  phone_nubmer               :string
#  user_id                    :bigint
#  request_id                 :bigint
#  talent_type_id             :bigint
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class TalentRequest < ApplicationRecord
  # belongs_to :user
  belongs_to :request
  belongs_to :talent_type
  belongs_to :user
end
