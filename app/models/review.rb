class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker
  validates :body, presence: true

  def post_date
    created_at.to_formatted_s(:long)
  end
end
