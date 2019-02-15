class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :brand
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.integer :quantity

      t.timestamps
    end
  end
end
