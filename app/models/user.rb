class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reservations
  has_many :reviews, through: :reservations

  has_secure_password
  validates :email, presence: true, uniqueness: true

end

#dependent: :destroy specifies that when a record in the model is destroyed, any associated records should also be destroyed. For example, when a User is destroyed, all of their associated rooms, reservations, and reviews should also be destroyed.
