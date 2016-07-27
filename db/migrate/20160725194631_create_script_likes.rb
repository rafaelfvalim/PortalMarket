class CreateScriptLikes < ActiveRecord::Migration
  def change
    create_table :script_likes do |t|
      t.integer :script_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
