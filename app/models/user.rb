class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy

  attr_accessor :current_password
  # validates :password, presence: {if: :current_password},
  #           format: {with: /\A[A-Za-z0-9][A-Za-z0-9]*\Z/,allow_blank: true},
  #           length: {minimum:4 ,maximum: 16, allow_blank: true}
  #
  # validates :name, presence: true,
  #           length: {minimum:2 ,maximum: 20, allow_blank: true},
  #           uniqueness: true
  # validates :login_name, presence: true,
  #           format: {with: /\A[A-Za-z0-9][A-Za-z0-9]*\Z/,allow_blank: true},
  #           length: {minimum:4 ,maximum: 16, allow_blank: true},
  #           uniqueness: true


end
