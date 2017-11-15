class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_many :reviews, dependent: :destroy

  def average_rating
    ratings = []
    reviews.each do |review|
      ratings << review.rating
    end
    if ratings[0].nil?
      return "No ratings yet"
    else
      average = ratings.reduce(:+) / ratings.size.to_f
      return average
    end

  end
end
