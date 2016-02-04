class AlerFunctionTransactionTypesAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :function_transaction_types , :users
    add_foreign_key :function_transaction_types , :scripts
  end
end
