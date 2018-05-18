class Beer < ApplicationRecord
  has_many :user_beers
  has_many :users, through: :user_beers
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :brewery, presence: true
  validates :style, presence: true

  def display
    "#{self.name} - #{self.brewery} - #{self.style}"
  end

  def self.organize
    self.order(:brewery, :name)
  end

  def overallrating
    UserBeer.prep_rating(self).average(:rating)
  end

  def self.not_current_user_beers(user)
    @beers = []
    self.all.each do |beer|
      if user.beers.exclude?(beer)
        @beers << beer
      end
    end
    @beers
  end
end
