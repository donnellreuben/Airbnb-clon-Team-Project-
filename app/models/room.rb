class Room < ApplicationRecord
  belongs_to :user
  has_many :room_images, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
