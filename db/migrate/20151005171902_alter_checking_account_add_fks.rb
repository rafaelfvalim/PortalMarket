class AlterCheckingAccountAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :checking_accounts , :scripts
    add_foreign_key :checking_accounts , :currencies
    add_foreign_key :checking_accounts , :members
  end
end
