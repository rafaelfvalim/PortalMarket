class AlterProcessModulesAddSelfFk < ActiveRecord::Migration
  def change
    add_foreign_key :process_modules, :process_modules, column: :referrer_process_module_id,  on_delete: :nullify, on_update: :nullify
  end
end
