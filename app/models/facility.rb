class Facility < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture

  validates :name, presence: true
  validates :explanation, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
