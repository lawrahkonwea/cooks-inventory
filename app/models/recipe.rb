class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  def self.public_recipes
    where(public_recipe: true)
  end
  def all_food_items
    recipe_foods.select(:food_id).distinct.count
  end

  def total_price
    recipe_foods.includes(:food).sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
  end
end
