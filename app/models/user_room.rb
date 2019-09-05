class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :user_rooms
end
