class AlterUsersAddTimezone < ActiveRecord::Migration
  def change
    add_column :users , :timezone , :string , null: true
  end
end
