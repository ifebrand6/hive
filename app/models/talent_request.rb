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
#  phone_number               :string
#  user_id                    :bigint
#  request_id                 :bigint
#  talent_type_id             :bigint
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class TalentRequest < ApplicationRecord
  acts_as_paranoid
  belongs_to :request
  belongs_to :talent_type

end
