class Article < ApplicationRecord
  validates :sentence, presence: true

  belongs_to       :user
  has_many         :comments, dependent: :destroy
  has_one_attached :image

end
