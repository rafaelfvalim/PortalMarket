class AlterUsersAddFkMembers < ActiveRecord::Migration
  def change
  	  add_foreign_key :users , :members
  end
end
