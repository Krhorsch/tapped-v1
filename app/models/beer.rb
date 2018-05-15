class Beer < ApplicationRecord
  has_many :user_beers
  has_many :users, through: :user_beers
  validates :name, presence: true
  validates :brewery, presence: true
  validates :style, presence: true

  def display
    "#{self.name} - #{self.brewery} - #{self.style}"
  end
end
