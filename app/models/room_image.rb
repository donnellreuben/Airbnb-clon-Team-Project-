class RoomImage < ApplicationRecord
  belongs_to :room

  validates :url, presence: true
end
