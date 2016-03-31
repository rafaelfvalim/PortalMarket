class AlterCheckingAccountAddScriptFk < ActiveRecord::Migration
  def change
    add_foreign_key :checking_accounts, :scripts
  end
end
