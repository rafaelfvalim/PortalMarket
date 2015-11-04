class AlterMembersAddColumnBankCcDigit < ActiveRecord::Migration
  def change
    add_column :members , :bank_cc_digit , :string , after: :bank_cc
  end
end
