class AlterTableMembersAddColumnUserId < ActiveRecord::Migration
  def change
    add_column :members, :user_id, :integer, after: :id
  end
end
