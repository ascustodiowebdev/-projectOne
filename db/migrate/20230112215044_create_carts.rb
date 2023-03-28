class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, foreign_key: true, array: true, default: []
      t.integer :quantity
      t.float :price
      t.timestamps
    end
  end
end
