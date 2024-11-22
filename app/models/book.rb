class Book < ApplicationRecord
  belongs_to :genre

  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :synopsis, length: { maximum: 1000 }, allow_blank: true
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :on_sale, inclusion: { in: [true, false] }
  validates :genre_id, presence: true

end
