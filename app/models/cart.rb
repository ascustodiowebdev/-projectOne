class Cart < ApplicationRecord
  # validates :price, presence: true
  # validates :quantity, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :items
end
