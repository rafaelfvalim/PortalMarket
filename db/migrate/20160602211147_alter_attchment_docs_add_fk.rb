class AlterAttchmentDocsAddFk < ActiveRecord::Migration
  def change
    add_foreign_key :attachment_docs, :scripts
  end
end
