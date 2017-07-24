class Sport < ApplicationRecord
  has_many :sneakers
  has_and_belongs_to_many :brands
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  def my_brands
    ids = sneakers.pluck(:brand_id).uniq
    Brand.find(ids)
  end
end
