class Stage < ApplicationRecord
  has_many :reservations , dependent: :destroy
  has_many :seats, dependent: :destroy
  belongs_to :actor
  belongs_to :category
end
