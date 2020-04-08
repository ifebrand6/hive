# == Schema Information
#
# Table name: expert_applications
#
#  id              :bigint           not null, primary key
#  firstName       :string(30)
#  lastName        :string(30)
#  email           :string
#  phoneNumber     :integer
#  contactAddress  :text
#  shortBio        :text
#  certification   :text             default([]), is an Array
#  status          :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  talent_type_id  :bigint
#  suggested_skill :string(50)
#
require 'test_helper'

class ExpertApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
