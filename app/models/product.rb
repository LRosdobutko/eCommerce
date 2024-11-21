class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: {maximum: 25}
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true }

end
