class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :event
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  belongs_to :facility
  has_many :messages, dependent: :destroy

  validates :title, presence: true
  validates :event_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
