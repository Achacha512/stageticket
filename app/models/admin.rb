class Admin < ApplicationRecord
  has_secure_password

  attr_accessor :current_password
  # validates :password, presence: {if: :current_password},
  #           format: {with: /\A[A-Za-z0-9][A-Za-z0-9]*\Z/,allow_blank: true}

end
