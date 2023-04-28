class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :price, presence: true
  # validates :total, presence: true
end

