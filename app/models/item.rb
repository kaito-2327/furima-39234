class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :take

  belongs_to :user
  has_one_attached :image
  # has_one    :buy

  validates :image,         presence: true
  validates :title,         presence: true
  validates :price,         presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :explan,        presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :situation_id,  numericality: { other_than: 1 } 
  validates :charge_id,     numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :take_id,       numericality: { other_than: 1 } 
end
