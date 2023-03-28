  class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    has_one :cart
    has_many :items, through: :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
