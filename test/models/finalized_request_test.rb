# == Schema Information
#
# Table name: finalized_requests
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  request_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class FinalizedRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
