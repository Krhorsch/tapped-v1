class UserBeer < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, presence: true
  validates_inclusion_of :rating, in: (1..5), :message => "must be between 1-5"
  scope :prep_rating, ->(beer) { where(beer_id: beer.id) }
  
end
