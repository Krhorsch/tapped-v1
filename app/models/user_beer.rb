class UserBeer < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, presence: true

  def beerinstance
    Beer.find_by(id: self.beer_id)
  end
end
