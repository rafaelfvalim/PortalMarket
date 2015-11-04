class AlterMembersRemoveColunsCustomerContributor < ActiveRecord::Migration
  def change
    remove_column :members, :contributor
    remove_column :members, :customer
  end
end
