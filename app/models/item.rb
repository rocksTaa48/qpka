class Item < ApplicationRecord
  include AASM
  belongs_to :subcategory
  # begin validatind
  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}
end
