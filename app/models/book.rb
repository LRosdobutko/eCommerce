class Book < ApplicationRecord
  belongs_to :genre

  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :synopsis, length: { maximum: 1000 }, allow_blank: true
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :on_sale, inclusion: { in: [true, false] }
  validates :genre_id, presence: true

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "genre_id", "id", "id_value", "on_sale", "price_cents", "publisher", "synopsis", "title", "updated_at"]
  end

end
