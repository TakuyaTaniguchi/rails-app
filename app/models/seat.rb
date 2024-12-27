class Seat < ApplicationRecord
  has_many :screens
  has_many :reservations
end
