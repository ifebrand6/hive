# == Schema Information
#
# Table name: requests
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  email        :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
