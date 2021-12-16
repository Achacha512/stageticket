class Reservation < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :stages, dependent: :destroy
  belongs_to :user
end
