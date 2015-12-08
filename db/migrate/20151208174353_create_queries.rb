class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :search_term
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
