class AlterMembersRemoveColumnBank < ActiveRecord::Migration
  def change
    remove_column :members, :bank
  end
end
