class Seat < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :stage

  validates :seat_price,presence: true,
            numericality: { only_integer: true,greater_than_or_equal_to:1}

end
