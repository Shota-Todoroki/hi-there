class Send < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :comment
  has_many :send_tag_relations
  has_many :tags, through: :send_tag_relations
end
