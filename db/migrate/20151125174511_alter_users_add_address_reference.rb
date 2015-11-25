class AlterUsersAddAddressReference < ActiveRecord::Migration
  def change
    add_column :users , :address_id , :integer , null: true, after: :email
  end
end
