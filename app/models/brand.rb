class Brand < ApplicationRecord
  has_many :sneakers
  has_and_belongs_to_many :sports
end
