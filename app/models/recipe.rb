class Recipe < ApplicationRecord
  belongs_to :user
  scope :public_recipes, -> { where(public_recipe: true) }
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy
end
