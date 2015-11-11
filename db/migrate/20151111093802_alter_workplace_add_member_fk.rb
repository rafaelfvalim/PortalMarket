class AlterWorkplaceAddMemberFk < ActiveRecord::Migration
  def change
    add_foreign_key :workplaces , :members
  end
end
