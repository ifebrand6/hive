class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
