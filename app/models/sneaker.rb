class Sneaker < ApplicationRecord
  has_many :reviews
  belongs_to :brand
  belongs_to :sport
  has_and_belongs_to_many :users
end
