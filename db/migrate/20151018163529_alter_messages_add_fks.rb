class AlterMessagesAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :messages , :users
    add_foreign_key :messages , :users , column: :message_to , null: false
  end
end
