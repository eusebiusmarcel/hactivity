class User < ApplicationRecord
  has_many :activities

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_secure_password
  validates :name,     presence: true, length: { in: 3..50 }
  validates :email,    presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, presence: true, allow_nil: true,  length: { in: 6..30 }
end
