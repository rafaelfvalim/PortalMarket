class AlterMemberScriptsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :member_scripts , :members
    add_foreign_key :member_scripts , :scripts
  end
end
