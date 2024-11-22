class Genre < ApplicationRecord
  has_many :books

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :description, length: { maximum: 500 }, allow_blank: true

end
