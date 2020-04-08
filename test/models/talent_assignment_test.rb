# == Schema Information
#
# Table name: talent_assignments
#
#  id                    :bigint           not null, primary key
#  engaged_date          :date
#  start_date            :date
#  end_date              :date
#  finalized_request_id  :bigint
#  expert_application_id :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require 'test_helper'

class TalentAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
