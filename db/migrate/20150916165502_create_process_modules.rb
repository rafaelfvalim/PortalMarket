class CreateProcessModules < ActiveRecord::Migration
  def change
    create_table :process_modules do |t|
      t.string :description
      t.integer :self_process_module_id

      t.timestamps null: false
    end
  end
end
