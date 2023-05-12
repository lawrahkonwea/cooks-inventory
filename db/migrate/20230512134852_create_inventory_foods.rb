class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.references :food, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :value, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
