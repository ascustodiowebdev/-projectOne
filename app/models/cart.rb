class Cart < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, presence: true
end
