class Sport < ApplicationRecord
  has_many :sneakers
  has_and_belongs_to_many :brands
end
