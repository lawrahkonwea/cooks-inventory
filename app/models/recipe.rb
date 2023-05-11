class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  def self.public_recipes
    where(public_recipe: true)
  end
end
