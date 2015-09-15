class AlterRelatedScriptsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :related_scripts, :scripts, on_delete: :nullify, on_update: :nullify
    add_foreign_key :related_scripts,  :scripts, column: :related_script_id,  on_delete: :nullify, on_update: :nullify
  end
end
