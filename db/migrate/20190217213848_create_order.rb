class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
