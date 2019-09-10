class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy, inverse_of: :room
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :name, length: { in: 1.. 255, allow_nil: false }
end
