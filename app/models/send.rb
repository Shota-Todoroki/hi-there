class Send < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :comment
  has_many :
end
