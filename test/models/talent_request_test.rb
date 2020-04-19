# == Schema Information
#
# Table name: talent_requests
#
#  id                         :bigint           not null, primary key
#  unit_price                 :integer
#  expected_contract_duration :integer
#  expected_start_date        :date
#  quantity                   :integer          default(1)
#  user_id                    :bigint
#  request_id                 :bigint
#  talent_type_id             :bigint
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
require 'test_helper'

class TalentRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
