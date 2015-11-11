class AlterTableWorkplacesAddMemberId < ActiveRecord::Migration
  def change
    add_column :workplaces , :member_id , :integer , null: false, after: :id
  end
end
