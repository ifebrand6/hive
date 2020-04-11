class Post < ApplicationRecord
  belongs_to :user
  attr_accessor(:title)
end
