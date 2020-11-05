class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX#, message: 'には英字と数字の両方を含めて,設定してください' 

  with_options presence: true do
    validates :nickname
    validates :country_id
  end
  belongs_to_active_hash :country
  belongs_to_active_hash :gender
  has_many :room_users
  has_many :room, through: :room_users
  has_many :sends
  has_many :comments
  has_many :messages
  has_one_attached :image
end
