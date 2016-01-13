class AlterMembersColumnBankIdPermitNull < ActiveRecord::Migration
  def change
    change_column :members, :bank_id, :integer, default: nil , null: true
  end
end
