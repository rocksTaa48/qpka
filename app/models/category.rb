class Category < ApplicationRecord
  has_many :subcategories
  has_many :items, through: :subcategories
  # begin validation

  validates :title, presence: true, length: {minimum: 5, maximum: 40}
end
