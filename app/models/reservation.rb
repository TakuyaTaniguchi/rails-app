class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :showtime
  belongs_to :seat
end
