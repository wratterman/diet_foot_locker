class User < ApplicationRecord
  has_secure_password
  enum role: %w(default, admin)
  validates :username, presence: true, uniqueness: true
  has_many :reviews
end
