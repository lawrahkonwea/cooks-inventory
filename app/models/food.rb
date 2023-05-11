class Food < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, foreign_key: 'food_id', dependent: :destroy
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy

  attribute :price, :decimal, precision: 4, scale: 2
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
