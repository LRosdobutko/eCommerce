class Category < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 25}
end
