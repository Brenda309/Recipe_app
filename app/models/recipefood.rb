class Recipefood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :quantity, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
