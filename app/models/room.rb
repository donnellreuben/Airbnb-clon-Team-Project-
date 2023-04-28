class Room < ApplicationRecord
  belongs_to :user
  has_many :room_images, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :total_occupancy, presence: true
  validates :total_bedrooms, presence: true
  validates :total_bathrooms, presence: true
end
