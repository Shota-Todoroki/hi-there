class Send < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comment
  has_many :send_tag_relations
  has_many :tags, through: :send_tag_relations

  validates :content, presence: true
end
