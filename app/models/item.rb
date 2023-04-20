class Item < ApplicationRecord
  has_one_attached :photo
  enum :category, { planet: 0, commet:
    1, asteroid: 2, star: 3, galaxy: 4 }
  validates :name, :description, :daily_price, :category, presence: true
end
