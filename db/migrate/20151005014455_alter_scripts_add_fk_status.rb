class AlterScriptsAddFkStatus < ActiveRecord::Migration
  def change
    add_foreign_key :scripts , :statuses , null: true , on_delete: :nullify, on_update: :nullify
  end
end
