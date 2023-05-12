class AddPublicToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :public, :boolean
  end
end
