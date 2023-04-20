class Item < ApplicationRecord
  has_many_attached :photos
  enum :category, { casa: 0, carteiras:
    1, chapeus: 2, bebe: 3}
  validates :name, :price, :category, presence: true
end
