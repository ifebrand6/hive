# == Schema Information
#
# Table name: experts
#
#  id              :bigint           not null, primary key
#  first_name       :string(30)
#  last_name        :string(30)
#  email           :string
#  phone_number     :integer
#  contactAddress  :text
#  short_bio        :text
#  certification   :text             default([]), is an Array
#  status          :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  talent_type_id  :bigint
#  suggested_skill :string(50)
#
require 'test_helper'

class ExpertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
