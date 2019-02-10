class CreateCategories < ActiveRecord::Migration[5.2]
  
  def change
    create_table :categories do |t|
      t.string :title, limit: 100, null: false

      t.timestamps

      t.index :title, unique: true
    end
  end

end
