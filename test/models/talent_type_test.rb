# == Schema Information
#
# Table name: talent_types
#
#  id                    :bigint           not null, primary key
#  expert_specialization :string(50)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require 'test_helper'

class TalentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
