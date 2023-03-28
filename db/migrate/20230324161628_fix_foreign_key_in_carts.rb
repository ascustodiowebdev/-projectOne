class FixForeignKeyInCarts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :carts, column: :item_id
    add_foreign_key :carts, :items, column: :item_id, type: :integer, array: true
  end
end
