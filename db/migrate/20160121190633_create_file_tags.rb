class CreateFileTags < ActiveRecord::Migration
  def change
    create_table :file_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
