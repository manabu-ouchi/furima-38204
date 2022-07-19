class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :delivery_day


  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  
end
