class User < ApplicationRecord
 validates :username, uniqueness: true, presence: true
#  Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 has_many :user_rooms
 has_many :rooms, through: :user_rooms
 has_many :room_messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
