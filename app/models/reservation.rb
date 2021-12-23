class Reservation < ApplicationRecord
  has_many :seats, dependent: :destroy
  belongs_to :stage, optional: true
  belongs_to :user
end
