class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :description
      t.text :definition
      t.text :long_text
      t.string :platform
      t.string :industry
      t.integer :solution_type_id
      t.string :script_file
      t.string :pdf_file
      t.string :complexity

      t.timestamps null: false
    end
  end
end
