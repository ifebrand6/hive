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
class Request < ApplicationRecord
  belongs_to :user
  has_many :talent_requests, dependent: :delete_all
end
