class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :review, dependent: :destroy
end

