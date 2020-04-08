# == Schema Information
#
# Table name: requests
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  email       :string
#  phoneNumber :string
#
require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
