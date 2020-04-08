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
class Request < ApplicationRecord
  belongs_to :user
  has_many :talent_requests, dependent: :delete_all
end
