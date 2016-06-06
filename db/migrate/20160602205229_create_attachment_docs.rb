class CreateAttachmentDocs < ActiveRecord::Migration
  def change
    create_table :attachment_docs do |t|
      t.integer :script_id
      t.string :file_name

      t.timestamps null: false
    end
  end
end
