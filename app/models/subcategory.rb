class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :items
  validates :title, presence: true, length: { minimum: 5, maximum: 40 }
end
