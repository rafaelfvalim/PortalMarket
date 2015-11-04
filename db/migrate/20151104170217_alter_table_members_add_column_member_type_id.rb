class AlterTableMembersAddColumnMemberTypeId < ActiveRecord::Migration
  def change
    add_column :members , :member_type_id , :integer , null: false, after: :user_id
  end
end
