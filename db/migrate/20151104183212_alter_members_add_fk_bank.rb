class AlterMembersAddFkBank < ActiveRecord::Migration
  def change
    add_foreign_key :members , :banks
  end
end
