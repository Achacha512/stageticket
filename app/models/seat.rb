class Seat < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :stage
end
