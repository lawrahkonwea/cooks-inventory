class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end

    add_index :recipe_foods, [:recipe_id, :food_id], unique: true
  end
end