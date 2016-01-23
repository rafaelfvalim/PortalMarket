class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :file_name
      t.string :file_type
      t.integer :user_id
      t.integer :folder_id
      t.integer :file_tag_id
      t.timestamps null: false
    end
  end
end
