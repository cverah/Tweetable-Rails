# frozen_string_literal: true

class ApiUser < ApplicationRecord
  has_secure_password
  has_secure_token

  # validates
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true

  # validates :password, length: { minimum: 6 }

  # enums
  enum :role, { member: 0, admin: 1 }

  def invalidate_token
    update(token: nil)
  end
end
