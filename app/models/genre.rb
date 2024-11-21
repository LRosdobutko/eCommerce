class Genre < ApplicationRecord

  has_many :products

  validates :name, presence: true, length: {maximum: 25}
  validates :description, presence: true
end
