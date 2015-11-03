class AlterMembersAddUsersFk < ActiveRecord::Migration
  def change
    add_foreign_key :members , :users
  end
end
