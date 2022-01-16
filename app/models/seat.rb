class Seat < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :stage

  validates :seat_price,numericality: { only_integer: true}

end
