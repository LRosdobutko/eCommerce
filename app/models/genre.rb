class Genre < ApplicationRecord
  has_many :books

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :description, length: { maximum: 500 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "name", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "books" ]
  end
end
