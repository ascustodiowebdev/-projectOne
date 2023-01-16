class Item < ApplicationRecord
  has_many :users, through: :cart
end
