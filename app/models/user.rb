class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_katakana, presence: true
  validates :last_name_katakana, presence: true
  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]/i.freeze
  validates :first_name, :last_name, format: { with: VALID_NAME_REGEX }
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/i.freeze
  validates :first_name_katakana, :last_name_katakana, format: { with: VALID_KATAKANA_REGEX }
 
  
  has_many :items
  # has_many :orders
         
end
