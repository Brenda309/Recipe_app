class Recipe < ApplicationRecord
  validates :name, presence: true
  has_many :recipe_foods, dependent: :delete_all
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
