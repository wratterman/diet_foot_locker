class Brand < ApplicationRecord
  has_many :sneakers
  has_and_belongs_to_many :sports

  def new_releases
    Sneaker.where(brand_id: id)[-3..-1]
  end

  def my_sports
    ids = sneakers.pluck(:sport_id).uniq
    Sport.find(ids)
  end
end
