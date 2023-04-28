class Review < ApplicationRecord
  belongs_to :reservation

  validates :rating, presence: true
  validates :comment, presence: true
end
