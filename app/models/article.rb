class Article < ApplicationRecord
  validates :content, presence: true

  belongs_to       :user
  has_many         :comments
  has_one_attached :image
end
