class Reservation < ApplicationRecord
  has_many :seats, dependent: :nullify
  belongs_to :stage, optional: true
  belongs_to :user
end
