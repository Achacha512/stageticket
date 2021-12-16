class Seat < ApplicationRecord
  belongs_to :reservation, oputional: true
  belongs_to :stage
end
