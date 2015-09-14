class AlterUsersAddInformations < ActiveRecord::Migration
  def change
    add_column :users, :effective_date, :datetime
  end
end
