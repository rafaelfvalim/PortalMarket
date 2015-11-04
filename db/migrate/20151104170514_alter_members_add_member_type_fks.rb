class AlterMembersAddMemberTypeFks < ActiveRecord::Migration
  def change
    add_foreign_key :members , :member_types
  end
end
