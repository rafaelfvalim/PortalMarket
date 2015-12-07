class AlterMembersAddFkUserIdMasterUserId < ActiveRecord::Migration
  def change
    add_foreign_key :members , :users , column: :master_user_id, null: true
  end
end
