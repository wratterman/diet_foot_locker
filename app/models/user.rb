class User < ApplicationRecord
  has_secure_password
  enum role: %w(default, admin)
  validates :username, presence: true, uniqueness: true
  has_many :reviews

  has_and_belongs_to_many :sneakers

  def admin?
    if role == 1
      true
    else
      false
    end
  end
end
