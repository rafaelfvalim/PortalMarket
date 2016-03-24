class AlterCheckingAccountsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :checking_accounts , :invoices
  end
end
