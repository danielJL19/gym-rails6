class User < ApplicationRecord
  # agrega validaciones al password(tamaño, confirmación,presente)
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
