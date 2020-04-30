class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :level, null:false
      t.integer :parent_id
      t.string :name, null:false
      t.timestamps
      t.timestamps
    end
  end
end
