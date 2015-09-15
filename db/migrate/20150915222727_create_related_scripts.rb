class CreateRelatedScripts < ActiveRecord::Migration
  def change
    create_table :related_scripts do |t|
      t.integer :script_id
      t.integer :related_script_id
    end
  end
end
