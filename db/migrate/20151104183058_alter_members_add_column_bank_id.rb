class AlterMembersAddColumnBankId < ActiveRecord::Migration
  def change
    add_column :members , :bank_id , :integer , null: false, after: :member_last_name
  end
end
