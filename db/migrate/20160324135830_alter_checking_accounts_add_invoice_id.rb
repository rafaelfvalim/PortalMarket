class AlterCheckingAccountsAddInvoiceId < ActiveRecord::Migration
  def change
    remove_foreign_key :checking_accounts, :scripts
    remove_foreign_key :checking_accounts, :members
    remove_column :checking_accounts, :member_id
    remove_column :checking_accounts, :script_id
    add_column :checking_accounts, :invoice_id, :integer
  end
end
