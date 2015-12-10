class AlterTableAddUserId < ActiveRecord::Migration
  def change
    add_column :searchjoy_searches , :user_id , :integer , null: true , after: :id
  end
end
