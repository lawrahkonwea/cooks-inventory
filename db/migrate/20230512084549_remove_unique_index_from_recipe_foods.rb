class RemoveUniqueIndexFromRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_index :recipe_foods, column: [:recipe_id, :food_id]
  end
end