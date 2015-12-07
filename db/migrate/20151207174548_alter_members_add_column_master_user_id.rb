class AlterMembersAddColumnMasterUserId < ActiveRecord::Migration
  def change
    add_column :members , :master_user_id , :integer , null: true , after: :user_id
  end
end
