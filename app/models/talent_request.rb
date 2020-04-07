class TalentRequest < ApplicationRecord
  belongs_to :request
  belongs_to :talent_type
  belongs_to :user
end
