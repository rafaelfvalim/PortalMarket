class AlterCheckingAccountAddScriptId < ActiveRecord::Migration
  def change
    add_column :checking_accounts, :script_id , :integer
  end
end
