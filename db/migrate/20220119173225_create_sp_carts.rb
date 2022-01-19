class CreateSpCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :sp_carts do |t|
      t.integer :id_product
      t.integer :quantity

      t.timestamps
    end
  end
end
