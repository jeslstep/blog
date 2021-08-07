class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :title, minimum: 5
end
