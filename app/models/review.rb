class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  def post_date
    created_at.to_formatted_s(:long)
  end
end
