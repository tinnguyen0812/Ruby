class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :des
      t.decimal :price
      t.string :color

      t.timestamps
    end
  end
end
