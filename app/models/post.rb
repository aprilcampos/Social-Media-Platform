class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 10 }
end
