class CreateViewPublications < ActiveRecord::Migration
  def change
    create_table :view_publications do |t|
      t.integer :publication_id
      t.boolean :visited
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
