class AlterMessages < ActiveRecord::Migration
  def change
    add_column :messages , :message_to , :integer , null: false
    add_column :messages , :user_id , :integer , null: false
  end
end
