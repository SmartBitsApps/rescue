class AddStatusToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :status, :integer, null: false, default: 0
    
    add_index :carts, :status
  end
end
