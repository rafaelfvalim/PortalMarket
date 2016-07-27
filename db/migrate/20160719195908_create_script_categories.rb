class CreateScriptCategories < ActiveRecord::Migration
  def change
    create_table :script_categories do |t|
      t.integer :category_id
      t.integer :script_id

      t.timestamps null: false
    end
  end
end
