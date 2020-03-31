class TalentRequest < ApplicationRecord
  # belongs_to :user
  belongs_to :request
  belongs_to :talent_type
  accepts_nested_attributes_for :request,  allow_destroy: true
end
