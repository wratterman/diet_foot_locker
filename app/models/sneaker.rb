class Sneaker < ApplicationRecord
  has_many :reviews
  belongs_to :brand
  belongs_to :sport
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
  validates :footlocker_url, presence: true
end
